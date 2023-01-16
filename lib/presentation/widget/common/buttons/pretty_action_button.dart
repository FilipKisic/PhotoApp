import 'package:flutter/material.dart';
import 'package:photo_app/presentation/style/pallete.dart';
import 'package:photo_app/presentation/style/text_style.dart';

class PrettyActionButton extends StatelessWidget {
  final VoidCallback onTapHandler;
  final String? label;
  final Widget? child;
  final Color? color;

  const PrettyActionButton({
    super.key,
    required this.onTapHandler,
    required this.label,
    required this.child,
    required this.color,
  });

  const PrettyActionButton.text({
    super.key,
    required this.onTapHandler,
    required this.label,
    this.color,
  }) : child = null;

  const PrettyActionButton.github({
    super.key,
    required this.onTapHandler,
  })  : label = null,
        child = const _IconTextContent(
          assetImage: AssetImage('assets/images/github_light.png'),
          label: 'GitHub',
          textColor: Colors.white,
        ),
        color = const Color(0xFF171C26);

  const PrettyActionButton.google({
    super.key,
    required this.onTapHandler,
  })  : label = null,
        child = const _IconTextContent(
          assetImage: AssetImage('assets/images/google_icon.png'),
          label: 'Google',
          textColor: textColor,
        ),
        color = backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapHandler,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: color,
          gradient: color != null
              ? null
              : const LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [primaryColor, secondaryColor],
                ),
          boxShadow: const [
            BoxShadow(
              color: shadowColor,
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: label == null
              ? child
              : Text(
                  label!,
                  textAlign: TextAlign.center,
                  style: standardTextStyle.copyWith(color: Colors.white),
                ),
        ),
      ),
    );
  }
}

class _IconTextContent extends StatelessWidget {
  final ImageProvider assetImage;
  final String label;
  final Color textColor;

  const _IconTextContent({
    required this.assetImage,
    required this.label,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: assetImage,
          width: 28,
        ),
        const SizedBox(width: 10),
        Text(
          label,
          style: standardTextStyle.copyWith(color: textColor),
        ),
      ],
    );
  }
}
