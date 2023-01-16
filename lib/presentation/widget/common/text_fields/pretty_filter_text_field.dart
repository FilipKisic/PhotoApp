import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_app/presentation/style/pallete.dart';
import 'package:intl/intl.dart';

class PrettyFilterTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isDateField;

  const PrettyFilterTextField({
    super.key,
    required this.controller,
    required this.label,
    this.isDateField = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: textColor,
      decoration: InputDecoration(
        hintText: label,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: textColor, width: 2),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: textColor, width: 3),
        ),
      ),
      readOnly: isDateField,
      onTap: !isDateField ? null : () => _showDatePicker(context),
    );
  }

  void _showDatePicker(final BuildContext context) => Platform.isAndroid
      ? _showMaterialDatePicker(context)
      : _showCupertinoDatePicker(
          context,
          CupertinoDatePicker(
            initialDateTime: DateTime.now(),
            mode: CupertinoDatePickerMode.date,
            use24hFormat: true,
            onDateTimeChanged: (final pickedDate) {
              controller.text = DateFormat('dd.MM.yyyy').format(pickedDate);
            },
          ),
        );

  void _showMaterialDatePicker(final BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd.MM.yyyy').format(pickedDate);
      controller.text = formattedDate;
    }
  }

  void _showCupertinoDatePicker(final BuildContext context, final Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }
}
