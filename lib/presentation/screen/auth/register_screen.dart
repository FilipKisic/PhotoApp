import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_app/di.dart';
import 'package:photo_app/presentation/style/pallete.dart';
import 'package:photo_app/presentation/style/text_style.dart';
import 'package:photo_app/presentation/widget/common/buttons/pretty_action_button.dart';
import 'package:photo_app/presentation/widget/common/text_fields/pretty_text_form_field.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _passwordConfirmFocusNode = FocusNode();
  bool _isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                const SizedBox(height: 50),
                const Text('Welcome!', style: bigTitleTextStyle),
                const Text('Sign up to get started', style: titleTextStyle),
                const SizedBox(height: 50),
                PrettyTextFormField(
                  controller: _emailController,
                  labelText: 'Email',
                  isEmail: true,
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: () => FocusScope.of(context).requestFocus(_passwordFocusNode),
                ),
                const SizedBox(height: 20),
                PrettyTextFormField(
                  controller: _passwordController,
                  labelText: 'Password',
                  focusNode: _passwordFocusNode,
                  isObscureText: _isPasswordHidden,
                  textInputAction: TextInputAction.next,
                  suffixIcon: GestureDetector(
                    onTap: _togglePasswordVisibilty,
                    child: Icon(
                      _isPasswordHidden ? Icons.visibility : Icons.visibility_off,
                      color: secondaryColor,
                      size: 20,
                    ),
                  ),
                  onFieldSubmitted: () => FocusScope.of(context).requestFocus(_passwordConfirmFocusNode),
                ),
                const SizedBox(height: 20),
                PrettyTextFormField(
                  controller: _passwordConfirmationController,
                  labelText: 'Password',
                  focusNode: _passwordConfirmFocusNode,
                  isObscureText: _isPasswordHidden,
                  suffixIcon: GestureDetector(
                    onTap: _togglePasswordVisibilty,
                    child: Icon(
                      _isPasswordHidden ? Icons.visibility : Icons.visibility_off,
                      color: secondaryColor,
                      size: 20,
                    ),
                  ),
                  onFieldSubmitted: () => _register(
                    _emailController.text.trim(),
                    _passwordController.text.trim(),
                    _passwordConfirmationController.text.trim(),
                  )
                ),
                const SizedBox(height: 20),
                PrettyActionButton.text(
                  label: 'Sign in',
                  onTapHandler: () => _register(
                    _emailController.text.trim(),
                    _passwordController.text.trim(),
                    _passwordConfirmationController.text.trim(),
                  ),
                ),
                const SizedBox(height: 15),
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: smallTextStyle,
                      children: [
                        const TextSpan(text: 'Already have an account? '),
                        TextSpan(
                          text: 'Sign in',
                          style: smallTextStyle.copyWith(color: secondaryColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  ),
                ),
                const Center(
                  child: Text('or continue with', style: smallTextStyle),
                ),
                const SizedBox(height: 20),
                PrettyActionButton.google(
                  onTapHandler: () {},
                ),
                const SizedBox(height: 20),
                PrettyActionButton.github(
                  onTapHandler: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordVisibilty() => setState(() => _isPasswordHidden = !_isPasswordHidden);
  
  void _register(final String email, final String password, final String passwordConfirmation) {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState!.validate()) {
      ref.read(userNotifierChangeProvider.notifier).registerWithEmailAndPassword(email, password, passwordConfirmation);
    }
  }
}
