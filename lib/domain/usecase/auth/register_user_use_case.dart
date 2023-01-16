import 'package:dartz/dartz.dart';
import 'package:photo_app/app/error/failure.dart';
import 'package:photo_app/domain/entity/app_user.dart';
import 'package:photo_app/domain/repository/user_repository.dart';

class RegisterUserUseCase {
  final UserRepository _userRepository;

  const RegisterUserUseCase(this._userRepository);

  Future<Either<Failure, AppUser>> registerUserWithEmailAndPassword(
    final String email,
    final String password,
    final String passwordConfirmation,
  ) async {
    if (password == passwordConfirmation) {
      final result = await _userRepository.registerUserWithEmailAndPassword(email, password);
      
      return result.fold(
        (failure) => Left(failure),
        (newUser) async {
          await _userRepository.insertUser(newUser);
          return Right(newUser);
        },
      );
    }
    return const Left(Failure.authError('Password values are not the same.'));
  }
}
