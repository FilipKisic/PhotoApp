import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_app/presentation/widget/common/error_dialog.dart';

class DialogUtils {
  static Future<void> showErrorDialog({
    required final BuildContext context,
    required final String title,
    required final String content,
  }) async {
    Platform.isIOS ? await _showCupertinoErrorDialog(context, title, content) : await _showMaterialErrorDialog(context, title, content);
  }

  static Future<void> _showMaterialErrorDialog(final BuildContext context, final String title, final String content) async {
    return await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return MaterialErrorDialog(
          title: title,
          content: content,
        );
      },
    );
  }

  static Future<void> _showCupertinoErrorDialog(final BuildContext context, final String title, final String content) async {
    return await showCupertinoDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return CupertinoErrorDialog(
          title: title,
          content: content,
        );
      },
    );
  }
}
