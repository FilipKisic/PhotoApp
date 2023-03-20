import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:photo_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('should find email and sign in text', (tester) async {
    app.main();
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(milliseconds: 1500));
    await tester.pumpAndSettle();

    final title = find.text('Email');
    final signIn = find.text('Sign in');

    expect(title, findsOneWidget);
    expect(signIn, findsOneWidget);
  });

  testWidgets('Should fill email and password textfields', (tester) async {
    app.main();
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(milliseconds: 1500));
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key('emailTextField')), 'test@test.com');
    await tester.enterText(find.byKey(const Key('passwordTextField')), 'password');

    await tester.pump();

    expect(find.text('test@test.com'), findsOneWidget);
    expect(find.text('password'), findsOneWidget);
  });
}
