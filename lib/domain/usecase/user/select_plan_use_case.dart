import 'package:dartz/dartz.dart';
import 'package:photo_app/domain/repository/user_repository.dart';
import 'package:photo_app/app/error/failure.dart';

class SelectPlanUseCase {
  final UserRepository _userRepository;

  SelectPlanUseCase(this._userRepository);

  Future<Either<Failure, void>> selectPlan(final String email, final int plan) async => await _userRepository.selectPlan(email, plan);
}
