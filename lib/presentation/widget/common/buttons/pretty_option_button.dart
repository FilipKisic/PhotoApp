import 'package:flutter/material.dart';
import 'package:photo_app/presentation/style/pallete.dart';
import 'package:photo_app/presentation/style/text_style.dart';

class PrettyOptionButton extends StatelessWidget {
  final bool isPrimary;
  final String labelText;
  final VoidCallback onTap;

  const PrettyOptionButton({
    super.key,
    required this.isPrimary,
    required this.labelText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        shadowColor: shadowColor,
        elevation: 5,
        backgroundColor: isPrimary ? textColor : backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        side: const BorderSide(color: textColor, width: 3)
      ),
      onPressed: onTap,
      child: Text(
        labelText,
        style: isPrimary ? smallTextStyle.copyWith(color: backgroundColor) : smallTextStyle,
      ),
    );
  }
}
