import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_app/di.dart';
import 'package:photo_app/presentation/routes/route_generator.dart';
import 'package:photo_app/presentation/style/pallete.dart';
import 'package:photo_app/presentation/style/text_style.dart';
import 'package:photo_app/presentation/widget/common/buttons/pretty_action_button.dart';
import 'package:photo_app/presentation/widget/common/text_fields/pretty_text_form_field.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
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
                const Text('Hello!', style: bigTitleTextStyle),
                const Text('Let\'s sign you in', style: titleTextStyle),
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
                  suffixIcon: GestureDetector(
                    onTap: _togglePasswordVisibilty,
                    child: Icon(
                      _isPasswordHidden ? Icons.visibility : Icons.visibility_off,
                      color: secondaryColor,
                      size: 20,
                    ),
                  ),
                  onFieldSubmitted: () => _loginWithEmailAndPassword(_emailController.text.trim(), _passwordController.text.trim()),
                ),
                const SizedBox(height: 50),
                PrettyActionButton.text(
                  label: 'Sign in',
                  onTapHandler: () => _loginWithEmailAndPassword(_emailController.text.trim(), _passwordController.text.trim()),
                ),
                const SizedBox(height: 15),
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: smallTextStyle,
                      children: [
                        const TextSpan(text: 'Don\'t have an account? '),
                        TextSpan(
                          text: 'Sign up',
                          style: smallTextStyle.copyWith(color: secondaryColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.of(context).pushNamed(RouteGenerator.registerScreen),
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
                  onTapHandler: () => ref.read(userNotifierChangeProvider.notifier).loginWithGoogle(),
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

  void _loginWithEmailAndPassword(final String email, final String password) async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState!.validate()) {
      ref.read(userNotifierChangeProvider.notifier).loginWithEmailAndPassword(email, password);
    }
  }
}
