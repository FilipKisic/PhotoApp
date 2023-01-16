import 'package:flutter/material.dart';
import 'package:photo_app/presentation/style/pallete.dart';
import 'package:photo_app/presentation/style/text_style.dart';

class PrettyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  final PreferredSizeWidget? bottom;
  final Widget? leading;
  final List<Widget>? actions;

  const PrettyAppBar({
    super.key,
    required this.titleText,
    this.bottom,
    this.leading,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: backgroundColor,
      shadowColor: backgroundColor,
      title: Text(titleText, style: standardTextStyle),
      leading: leading,
      leadingWidth: 75,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight - 20);
}
