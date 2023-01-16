import 'package:flutter/material.dart';

enum PageTransition { slide, bottomUp }

class PrettyPageRoute extends PageRouteBuilder {
  final Widget page;
  final PageTransition transition;
  @override
  final RouteSettings settings;

  PrettyPageRoute({required this.page, required this.settings, this.transition = PageTransition.slide})
      : super(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return transition == PageTransition.slide
                ? SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1, 0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  )
                : SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
          },
        );
}
