import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_app/di.dart';
import 'package:photo_app/presentation/routes/route_generator.dart';
import 'package:photo_app/presentation/style/pallete.dart';
import 'package:photo_app/presentation/style/text_style.dart';
import 'package:photo_app/presentation/widget/common/subscription_plan_card.dart';

class PlanSelectionScreen extends ConsumerWidget {
  const PlanSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Text('Choose a plan', style: bigTitleTextStyle),
              const Text('You can always change it', style: titleTextStyle),
              const SizedBox(height: 30),
              SubscriptionPlanCard(
                title: 'Free',
                description: '10 uploads daily, 5MB max',
                price: 0,
                gradientStart: silverGradientStartColor,
                gradientEnd: silverGradientEndColor,
                textColor: Colors.white,
                onTapHandler: () => _choosePlan(context, ref, 1),
              ),
              const SizedBox(height: 20),
              SubscriptionPlanCard(
                title: 'Pro',
                description: 'Unlimited daily uploads',
                price: 1.99,
                gradientStart: primaryColor,
                gradientEnd: secondaryColor,
                textColor: Colors.white,
                onTapHandler: () => _choosePlan(context, ref, 2),
              ),
              const SizedBox(height: 20),
              SubscriptionPlanCard(
                title: 'Gold',
                description: 'Unlimited upload size',
                price: 4.99,
                gradientStart: goldGradientStartColor,
                gradientEnd: goldGradientEndColor,
                textColor: Colors.white,
                onTapHandler: () => _choosePlan(context, ref, 3),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _choosePlan(final BuildContext context, final WidgetRef ref, final int plan) {
    ref.read(userNotifierChangeProvider).selectPlan(plan);
    Navigator.pushReplacementNamed(context, RouteGenerator.mainScreen);
  }
}
