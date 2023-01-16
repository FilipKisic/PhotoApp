import 'package:dartz/dartz.dart';
import 'package:photo_app/domain/entity/app_user.dart';
import 'package:photo_app/domain/repository/user_repository.dart';
import 'package:photo_app/app/error/failure.dart';

class LoginUserUseCase {
  final UserRepository _userRepository;

  const LoginUserUseCase(this._userRepository);

  Future<Either<Failure, AppUser>> loginWithEmailAndPassword(final String email, final String password) async {
    final result = await _userRepository.loginWithEmailAndPassword(email, password);
    return result.fold(
      (failure) => Left(failure),
      (userBasicData) async => await _userRepository.getUserById(userBasicData.userId!),
    );
  }

  Future<Either<Failure, AppUser>> loginWithGoogle() async => await _userRepository.loginWithGoogle();

  bool isUserLoggedIn() => _userRepository.isUserLoggedIn();

  String? getCurrentUserId() => _userRepository.getCurrentUserId();

  Future<Either<Failure, AppUser>> getUserById(final String userId) async => await _userRepository.getUserById(userId);
}
