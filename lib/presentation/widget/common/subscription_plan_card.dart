import 'package:flutter/material.dart';
import 'package:photo_app/presentation/style/text_style.dart';

class SubscriptionPlanCard extends StatelessWidget {
  final String title;
  final String description;
  final double price;
  final Color gradientStart;
  final Color gradientEnd;
  final Color textColor;
  final VoidCallback onTapHandler;

  const SubscriptionPlanCard({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.gradientStart,
    required this.gradientEnd,
    required this.textColor,
    required this.onTapHandler,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapHandler,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [gradientStart, gradientEnd],
            ),
            boxShadow: [BoxShadow(color: gradientStart.withOpacity(0.5), blurRadius: 5, offset: const Offset(0, 5))]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: titleTextStyle.copyWith(color: textColor)),
                Text(description, style: standardTextStyle.copyWith(color: textColor)),
              ],
            ),
            Text('${price.toStringAsPrecision(3)}€', style: titleTextStyle.copyWith(color: textColor)),
          ],
        ),
      ),
    );
  }
}
