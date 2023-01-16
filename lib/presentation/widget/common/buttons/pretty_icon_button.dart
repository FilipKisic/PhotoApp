import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:photo_app/presentation/style/pallete.dart';

class PrettyIconButton extends StatelessWidget {
  final IconData icon;
  const PrettyIconButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: textColor,
          padding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: () => log('Not implemented yet...', name: 'PrettyIconButton'),
        child: Icon(
          icon,
          size: 22,
        ),
      ),
    );
  }
}
