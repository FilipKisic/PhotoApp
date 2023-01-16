import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:photo_app/app/error/failure.dart';
import 'package:photo_app/domain/entity/post.dart';

class PostApi {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Either<Failure, List<Post>>> getAllPosts() async {
    try {
      final posts = await _firestore.collection('post').orderBy('createDate', descending: true).get();
      final listOfPosts = posts.docs.map((postJson) => Post.fromSnapshot(postJson)).toList();
      return Right(listOfPosts);
    } on Exception catch (_) {
      return const Left(Failure.generalError('There was an error with feed list...'));
    }
  }

  Future<Either<Failure, void>> uploadNewPost(final Post newPost) async {
    final postsRef = _firestore.collection('post').withConverter(
          fromFirestore: (snapshot, _) => Post.fromSnapshot(snapshot),
          toFirestore: (post, _) => post.toJson(),
        );
    try {
      await postsRef.add(newPost);
      return const Right(null);
    } on Exception catch (_) {
      return const Left(Failure.generalError('There was an error with post upload...'));
    }
  }

  Future<Either<Failure, List<Post>>> getUserPosts(final String userId) async {
    try {
      final posts = await _firestore.collection('post').where('userId', isEqualTo: userId).get();
      final listOfPosts = posts.docs.map((postJson) => Post.fromSnapshot(postJson)).toList();
      return Right(listOfPosts);
    } on Exception catch (_) {
      return const Left(Failure.generalError('There was an error with profile pictures...'));
    }
  }
}
