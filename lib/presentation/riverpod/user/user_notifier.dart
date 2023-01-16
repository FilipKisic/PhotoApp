import 'package:flutter/material.dart';
import 'package:photo_app/domain/entity/app_user.dart';
import 'package:photo_app/domain/usecase/auth/login_user_use_case.dart';
import 'package:photo_app/domain/usecase/auth/register_user_use_case.dart';
import 'package:photo_app/domain/usecase/user/select_plan_use_case.dart';
import 'package:photo_app/globals.dart';
import 'package:photo_app/presentation/routes/route_generator.dart';
import 'package:photo_app/presentation/util/dialog_utils.dart';
import 'package:photo_app/presentation/widget/common/pretty_loading_dialog.dart';

class UserNotifier extends ChangeNotifier {
  final LoginUserUseCase _loginUserUseCase;
  final RegisterUserUseCase _registerUserUseCase;
  final SelectPlanUseCase _selectPlanUseCase;
  late AppUser _currentUser;

  UserNotifier(this._loginUserUseCase, this._registerUserUseCase, this._selectPlanUseCase);

  AppUser get currentUser => _currentUser;

  void loginWithEmailAndPassword(final String email, final String password) async {
    PrettyLoadingDialog().show();
    final result = await _loginUserUseCase.loginWithEmailAndPassword(email, password);
    PrettyLoadingDialog().dismiss();

    result.fold(
      (failure) => DialogUtils.showErrorDialog(context: navigatorKey.currentContext!, title: 'Sign in error', content: failure.message),
      (appUser) {
        _currentUser = appUser;
        Navigator.pushReplacementNamed(navigatorKey.currentContext!, RouteGenerator.planSelectionScreen);
      },
    );
  }

  void registerWithEmailAndPassword(final String email, final String password, final String passwordConfirmation) async {
    PrettyLoadingDialog().show();
    final result = await _registerUserUseCase.registerUserWithEmailAndPassword(email, password, passwordConfirmation);
    PrettyLoadingDialog().dismiss();

    result.fold(
      (failure) => DialogUtils.showErrorDialog(context: navigatorKey.currentContext!, title: 'Sign up error', content: failure.message),
      (appUser) {
        _currentUser = appUser;
        Navigator.pushReplacementNamed(navigatorKey.currentContext!, RouteGenerator.planSelectionScreen);
      },
    );
  }

  void loginWithGoogle() async {
    PrettyLoadingDialog().show();
    final result = await _loginUserUseCase.loginWithGoogle();
    PrettyLoadingDialog().dismiss();

    result.fold(
      (failure) => DialogUtils.showErrorDialog(context: navigatorKey.currentContext!, title: 'Sign in error', content: failure.message),
      (appUser) {
        _currentUser = appUser;
        Navigator.pushReplacementNamed(navigatorKey.currentContext!, RouteGenerator.planSelectionScreen);
      },
    );
  }

  void redirectBasedOnUserState(final BuildContext context) async {
    if (_loginUserUseCase.isUserLoggedIn()) {
      final currentUserId = _loginUserUseCase.getCurrentUserId();
      final result = await _loginUserUseCase.getUserById(currentUserId!);
      result.fold(
        (failure) => null,
        (appUser) => _currentUser = appUser,
      );
      Navigator.pushReplacementNamed(context, RouteGenerator.mainScreen);
    } else {
      Navigator.pushReplacementNamed(context, RouteGenerator.loginScreen);
    }
  }

  void selectPlan(final int plan) async => _selectPlanUseCase.selectPlan(_currentUser.email!, plan);

  String? getCurrentUserId() => _loginUserUseCase.getCurrentUserId();
}
