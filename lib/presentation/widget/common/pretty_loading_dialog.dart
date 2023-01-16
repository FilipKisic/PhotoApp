import 'package:flutter/material.dart';
import 'package:photo_app/globals.dart';
import 'package:photo_app/presentation/style/pallete.dart';

class PrettyLoadingDialog {
  static final PrettyLoadingDialog _singleton = PrettyLoadingDialog._internal();
  factory PrettyLoadingDialog() => _singleton;
  PrettyLoadingDialog._internal();
  
  bool isDisplayed = false;

  show() {
    if (isDisplayed) {
      return;
    }
    showDialog<void>(
      context: navigatorKey.currentContext!,
      barrierDismissible: false,
      barrierColor: backgroundColor.withOpacity(0.5),
      builder: (BuildContext context) {
        isDisplayed = true;
        return WillPopScope(
          onWillPop: () async => false,
          child: const Center(
            child: CircularProgressIndicator(color: primaryColor),
          ),
        );
      },
    );
  }

  dismiss() {
    if (isDisplayed) {
      Navigator.of(navigatorKey.currentContext!).pop();
      isDisplayed = false;
    }
  }
}