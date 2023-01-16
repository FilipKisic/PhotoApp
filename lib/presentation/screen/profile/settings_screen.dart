import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_app/di.dart';
import 'package:photo_app/domain/entity/app_user.dart';
import 'package:photo_app/presentation/routes/route_generator.dart';
import 'package:photo_app/presentation/style/pallete.dart';
import 'package:photo_app/presentation/style/text_style.dart';
import 'package:photo_app/presentation/widget/common/buttons/pretty_option_button.dart';
import 'package:photo_app/presentation/widget/common/pretty_app_bar.dart';
import 'package:photo_app/presentation/widget/common/subscription_plan_card.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  static final availableList = [
    SubscriptionPlanCard(
      title: 'Free',
      description: '10 uploads daily, 5MB max',
      price: 0,
      gradientStart: silverGradientStartColor,
      gradientEnd: silverGradientEndColor,
      textColor: Colors.white,
      onTapHandler: () {},
    ),
    SubscriptionPlanCard(
      title: 'Pro',
      description: 'Unlimited daily uploads',
      price: 1.99,
      gradientStart: primaryColor,
      gradientEnd: secondaryColor,
      textColor: Colors.white,
      onTapHandler: () {},
    ),
    SubscriptionPlanCard(
      title: 'Gold',
      description: 'Unlimited upload size',
      price: 4.99,
      gradientStart: goldGradientStartColor,
      gradientEnd: goldGradientEndColor,
      textColor: Colors.white,
      onTapHandler: () {},
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appUser = ref.read(userNotifierChangeProvider.notifier).currentUser;
    return Scaffold(
      appBar: PrettyAppBar(
        titleText: 'Settings',
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
          child: GestureDetector(
            child: const Text('Back', style: smallTextStyle),
            onTap: () => Navigator.of(context).pop(),
          ),
        ),
        actions: [
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 15, 8),
              child: Text('Sign out', style: smallTextStyle),
            ),
            onTap: () => _logout(context),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Your current plan:', style: smallTextStyle),
              const SizedBox(height: 15),
              _buildPlanCardForUser(appUser),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PrettyOptionButton(
                    labelText: 'Cancel',
                    isPrimary: false,
                    onTap: () => log('Not implemented yet...', name: 'Cancel button'),
                  ),
                  PrettyOptionButton(
                    labelText: 'Upgrade',
                    isPrimary: true,
                    onTap: () => log('Not implemented yet...', name: 'Upgrade button'),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Divider(color: textColor, thickness: 1),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Your consumption so far:', style: smallTextStyle),
                  Text('${appUser.expenses?.toStringAsFixed(2)}€', style: titleTextStyle),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlanCardForUser(final AppUser appUser) {
    //replace with enum, better solution
    if (appUser.plan == 0) {
      return availableList[0];
    } else if (appUser.plan == 1) {
      return availableList[1];
    } else {
      return availableList[2];
    }
  }

  void _logout(final BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(RouteGenerator.loginScreen, (_) => false);
  }
}
