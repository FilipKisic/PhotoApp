import 'package:flutter/material.dart';
import 'package:photo_app/presentation/style/pallete.dart';
import 'package:photo_app/presentation/style/text_style.dart';
import 'package:control_style/decorated_input_border.dart';

class PrettyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isEmail;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final Function? onFieldSubmitted;
  final bool isObscureText;
  final Widget? suffixIcon;
  final bool disabledValidation;
  final int minLines;
  final int maxLines;

  const PrettyTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.isEmail = false,
    this.focusNode,
    this.textInputAction,
    this.textInputType,
    this.onFieldSubmitted,
    this.isObscureText = false,
    this.suffixIcon,
    this.disabledValidation = false,
    this.minLines = 1,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: standardTextStyle,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        filled: true,
        fillColor: backgroundColor,
        alignLabelWithHint: true,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
        label: Text(labelText, style: smallTextStyle),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 25),
          child: suffixIcon,
        ),
        errorStyle: standardTextStyle.copyWith(color: errorColor),
        enabledBorder: DecoratedInputBorder(
          shadow: const [
            BoxShadow(
              color: shadowColor,
              blurRadius: 5,
              offset: Offset(0, 5),
            )
          ],
          child: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: const Color(0xFF171C26).withOpacity(0.3)),
          ),
        ),
        focusedBorder: DecoratedInputBorder(
          shadow: const [
            BoxShadow(
              color: shadowColor,
              blurRadius: 5,
              offset: Offset(0, 5),
            )
          ],
          child: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: primaryColor),
          ),
        ),
        errorBorder: DecoratedInputBorder(
          shadow: const [
            BoxShadow(
              color: errorShadowColor,
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
          ],
          child: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: errorColor),
          ),
        ),
        focusedErrorBorder: DecoratedInputBorder(
          shadow: const [
            BoxShadow(
              color: errorShadowColor,
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
          ],
          child: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: errorColor),
          ),
        ),
      ),
      controller: controller,
      minLines: minLines,
      maxLines: maxLines,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      focusNode: focusNode,
      textInputAction: textInputAction,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      enableSuggestions: false,
      autocorrect: false,
      cursorColor: primaryColor,
      obscureText: isObscureText,
      validator: disabledValidation ? null : _doBasicValidation,
      onFieldSubmitted: (_) => onFieldSubmitted?.call(),
    );
  }

  String? _doBasicValidation(final String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some value';
    }
    if (isEmail && _doesNotContainEmailCharacters(value)) {
      return 'Please enter valid email';
    }
    return null;
  }

  bool _doesNotContainEmailCharacters(final String value) =>
      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
}
