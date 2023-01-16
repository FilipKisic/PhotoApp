import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_app/di.dart';
import 'package:photo_app/presentation/style/pallete.dart';
import 'package:photo_app/presentation/style/text_style.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _redirectUser(context, ref);
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(image: AssetImage('assets/images/logo.png')),
            const SizedBox(height: 20),
            Text('Photo App', style: titleTextStyle.copyWith(color: primaryColor)),
          ],
        ),
      ),
    );
  }

  void _redirectUser(final BuildContext context, final WidgetRef ref) async => await Future.delayed(const Duration(milliseconds: 500))
      .then((_) => ref.read(userNotifierChangeProvider.notifier).redirectBasedOnUserState(context));
}
