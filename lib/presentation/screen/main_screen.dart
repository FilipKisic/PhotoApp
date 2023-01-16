import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:photo_app/globals.dart';
import 'package:photo_app/presentation/routes/route_generator.dart';
import 'package:photo_app/presentation/screen/post/pick_image_screen.dart';
import 'package:photo_app/presentation/screen/post/post_feed_screen.dart';
import 'package:photo_app/presentation/screen/profile/profile_screen.dart';
import 'package:photo_app/presentation/style/pallete.dart';
import 'package:photo_app/presentation/style/text_style.dart';

class MainScreen extends ConsumerStatefulWidget {
  static final PersistentTabController controller = PersistentTabController(initialIndex: 0);
  const MainScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: MainScreen.controller,
      screens: navBarScreens,
      items: navBarItems,
      confineInSafeArea: true,
      backgroundColor: backgroundColor,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: false,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: const NavBarDecoration(colorBehindNavBar: backgroundColor),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style16,
    );
  }
}

const List<Widget> navBarScreens = [PostFeedScreen(), PickImageScreen(), ProfileScreen()];

final List<PersistentBottomNavBarItem> navBarItems = <PersistentBottomNavBarItem>[
  PersistentBottomNavBarItem(
    icon: const Icon(Icons.home, size: 28),
    inactiveIcon: const Icon(Icons.home_outlined, size: 28),
    title: 'Home',
    textStyle: standardTextStyle.copyWith(fontSize: 12),
    activeColorPrimary: primaryColor,
    inactiveColorPrimary: textColor,
    routeAndNavigatorSettings: const RouteAndNavigatorSettings(
      initialRoute: RouteGenerator.postFeedScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
    ),
  ),
  PersistentBottomNavBarItem(
    icon: const Icon(Icons.add_rounded, size: 32),
    title: 'Add',
    textStyle: standardTextStyle.copyWith(fontSize: 12),
    activeColorPrimary: secondaryColor,
    activeColorSecondary: backgroundColor,
    onPressed: (_) => pushNewScreenWithRouteSettings(
      navigatorKey.currentContext!,
      screen: const PickImageScreen(),
      settings: const RouteSettings(name: RouteGenerator.pickImageScreen),
      pageTransitionAnimation: PageTransitionAnimation.slideUp,
    ),
  ),
  PersistentBottomNavBarItem(
    icon: const Icon(Icons.person_rounded, size: 28),
    inactiveIcon: const Icon(Icons.person_outline_rounded, size: 28),
    activeColorPrimary: primaryColor,
    inactiveColorPrimary: textColor,
    title: 'Profile',
    textStyle: standardTextStyle.copyWith(fontSize: 12),
    routeAndNavigatorSettings: const RouteAndNavigatorSettings(
      initialRoute: RouteGenerator.profileScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
    ),
  ),
];