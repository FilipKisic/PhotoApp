import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_app/globals.dart';
import 'package:photo_app/presentation/routes/route_generator.dart';
import 'package:photo_app/presentation/style/pallete.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PhotoApp',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        fontFamily: 'Nunito',
        scaffoldBackgroundColor: backgroundColor,
        primaryColor: primaryColor,
        inputDecorationTheme: const InputDecorationTheme(
          floatingLabelStyle: TextStyle(color: primaryColor),
        ),
        pageTransitionsTheme: PageTransitionsTheme(
          builders: Map<TargetPlatform, PageTransitionsBuilder>.fromIterable(
            TargetPlatform.values,
            value: (_) => const ZoomPageTransitionsBuilder(),
          ),
        ),
      ),
      initialRoute: RouteGenerator.splashScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
