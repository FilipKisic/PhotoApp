import 'package:dartz/dartz.dart';
import 'package:photo_app/app/error/failure.dart';
import 'package:photo_app/data/source_remote/auth/auth_api.dart';
import 'package:photo_app/data/source_remote/post/firebase_storage_api.dart';
import 'package:photo_app/data/source_remote/user/user_api.dart';
import 'package:photo_app/domain/entity/app_user.dart';
import 'package:photo_app/domain/entity/post.dart';
import 'package:photo_app/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final AuthApi _authApi;
  final UserApi _userApi;
  final FirebaseStorageApi _firebaseStorageApi;

  const UserRepositoryImpl(
    this._authApi,
    this._userApi,
    this._firebaseStorageApi,
  );

  @override
  Future<Either<Failure, AppUser>> registerUserWithEmailAndPassword(final String email, final String password) async =>
      await _authApi.registerWithEmailAndPassword(email, password);

  @override
  Future<Either<Failure, AppUser>> loginWithEmailAndPassword(final String email, final String password) async =>
      await _authApi.loginWithEmailAndPassword(email, password);

  @override
  Future<Either<Failure, AppUser>> loginWithGoogle() async => await _authApi.loginWithGoogle();

  @override
  bool isUserLoggedIn() => _authApi.isUserLoggedIn();

  @override
  Future<Either<Failure, AppUser>> getUserById(final String userId) async {
    final result = await _userApi.getUserById(userId);

    return result.fold(
      (failure) => Left(failure),
      (user) async => Right(await _getDownloadUrlForUserImage(user)),
    );
  }

  @override
  Future<Either<Failure, PostUser>> getPostUserById(final String userId) async => await _userApi.getPostUserById(userId);

  @override
  Future<Either<Failure, void>> selectPlan(final String email, final int plan) async => await _userApi.sendSubscriptionPlan(email, plan);

  @override
  Future<Either<Failure, void>> insertUser(AppUser newUser) async => await _userApi.insertUser(newUser);

  @override
  String? getCurrentUserId() => _authApi.currentUserId;

  Future<AppUser> _getDownloadUrlForUserImage(final AppUser user) async {
    String? imageUrl = user.imageUrl;
    if (imageUrl != null) {
      imageUrl = imageUrl.substring(imageUrl.lastIndexOf('/'));
      user.imageUrl = await _firebaseStorageApi.getDownloadUrl(imageUrl);
    }
    return user;
  }
}
