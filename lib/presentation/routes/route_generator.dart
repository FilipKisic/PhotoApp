import 'package:flutter/material.dart';
import 'package:photo_app/presentation/routes/pretty_page_route.dart';
import 'package:photo_app/presentation/screen/auth/login_screeen.dart';
import 'package:photo_app/presentation/screen/auth/plan_selection_screen.dart';
import 'package:photo_app/presentation/screen/auth/register_screen.dart';
import 'package:photo_app/presentation/screen/post/add_post_description_screen.dart';
import 'package:photo_app/presentation/screen/post/pick_image_screen.dart';
import 'package:photo_app/presentation/screen/post/post_details_screen.dart';
import 'package:photo_app/presentation/screen/post/post_feed_screen.dart';
import 'package:photo_app/presentation/screen/main_screen.dart';
import 'package:photo_app/presentation/screen/profile/profile_screen.dart';
import 'package:photo_app/presentation/screen/profile/settings_screen.dart';
import 'package:photo_app/presentation/screen/splash_screen.dart';

class RouteGenerator {
  static const String splashScreen = '/';
  static const String loginScreen = '/login';
  static const String registerScreen = '/register';
  static const String planSelectionScreen = '/plan';
  static const String mainScreen = '/main';
  static const String postFeedScreen = '/feed';
  static const String postDetailsScreen = '/details';
  static const String profileScreen = '/profile';
  static const String settingsScreen = '/settings';
  static const String pickImageScreen = '/pickImage';
  static const String addDescriptionScreen = '/addDescription';

  const RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return PrettyPageRoute(page: const SplashScreen(), settings: settings);
      case loginScreen:
        return PrettyPageRoute(page: const LoginScreen(), settings: settings);
      case registerScreen:
        return PrettyPageRoute(page: const RegisterScreen(), settings: settings);
      case planSelectionScreen:
        return PrettyPageRoute(page: const PlanSelectionScreen(), settings: settings);
      case mainScreen:
        return PrettyPageRoute(page: const MainScreen(), settings: settings);
      case postFeedScreen:
        return PrettyPageRoute(page: const PostFeedScreen(), settings: settings);
      case postDetailsScreen:
        return MaterialPageRoute(builder: (_) => const PostDetailsScreen(), settings: settings);
      case profileScreen:
        return PrettyPageRoute(page: const ProfileScreen(), settings: settings);
      case settingsScreen:
        return PrettyPageRoute(page: const SettingsScreen(), settings: settings);
      case pickImageScreen:
        return PrettyPageRoute(page: const PickImageScreen(), settings: settings, transition: PageTransition.bottomUp);
      case addDescriptionScreen:
        return PrettyPageRoute(page: const AddPostDescriptionScreen(), settings: settings, transition: PageTransition.bottomUp);
      default:
        throw const RouteException('Route not found');
    }
  }
}

class RouteException {
  final String message;

  const RouteException(this.message);
}
