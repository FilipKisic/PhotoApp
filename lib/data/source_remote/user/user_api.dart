import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:photo_app/domain/entity/app_user.dart';
import 'package:photo_app/domain/entity/post.dart';
import 'package:photo_app/app/error/failure.dart';

class UserApi {
  final FirebaseFirestore _firestoreInstance = FirebaseFirestore.instance;

  Future<Either<Failure, AppUser>> getUserById(final String userId) async {
    try {
      final result = await _firestoreInstance.collection('user').where('userId', isEqualTo: userId).get();
      final user = AppUser.fromSnapshot(result.docs.first);
      return Right(user);
    } on Exception catch (_) {
      return const Left(Failure.generalError('There was an error with getting your info...'));
    }
  }

  Future<Either<Failure, PostUser>> getPostUserById(final String userId) async {
    try {
      final result = await _firestoreInstance.collection('user').where('userId', isEqualTo: userId).get();
      final user = PostUser.fromSnapshot(result.docs.first);
      return Right(user);
    } on Exception catch (_) {
      return const Left(Failure.generalError('There was an error with get post user...'));
    }
  }

  Future<Either<Failure, void>> sendSubscriptionPlan(final String email, final int plan) async {
    try {
      final result = await _firestoreInstance.collection('user').where('email', isEqualTo: email).get();
      final batch = _firestoreInstance.batch();
      batch.update(result.docs[0].reference, {'plan': plan});
      return Right(batch.commit());
    } on Exception catch (_) {
      return const Left(Failure.generalError('There was an error with plan selection...'));
    }
  }

  Future<Either<Failure, void>> insertUser(final AppUser newUser) async {
    final userRef = _firestoreInstance.collection('user').withConverter(
          fromFirestore: (snapshot, _) => AppUser.fromSnapshot(snapshot),
          toFirestore: (user, _) => user.toJson(),
        );
    try {
      await userRef.add(newUser);
      return const Right(null);
    } on Exception catch (_) {
      return const Left(Failure.generalError('There was an error with saving your data...'));
    }
  }
}
