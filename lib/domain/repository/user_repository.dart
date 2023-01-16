import 'package:dartz/dartz.dart';
import 'package:photo_app/domain/entity/app_user.dart';
import 'package:photo_app/domain/entity/post.dart';
import 'package:photo_app/app/error/failure.dart';

abstract class UserRepository {
  Future<Either<Failure, AppUser>> registerUserWithEmailAndPassword(final String email, final String password);
  Future<Either<Failure, AppUser>> loginWithEmailAndPassword(final String email, final String password);
  Future<Either<Failure, AppUser>> loginWithGoogle();
  bool isUserLoggedIn();
  Future<Either<Failure, AppUser>> getUserById(final String userId);
  Future<Either<Failure, PostUser>> getPostUserById(final String userId);
  Future<Either<Failure, void>> selectPlan(final String email, final int plan);
  Future<Either<Failure, void>> insertUser(final AppUser newUser);
  String? getCurrentUserId();
}
