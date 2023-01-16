import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_app/di.dart';
import 'package:photo_app/presentation/routes/route_generator.dart';
import 'package:photo_app/presentation/style/pallete.dart';
import 'package:photo_app/presentation/style/text_style.dart';
import 'package:photo_app/presentation/widget/common/pretty_app_bar.dart';
import 'package:photo_app/presentation/widget/profile/user_gallery.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appUser = ref.read(userNotifierChangeProvider.notifier).currentUser;
    final imageSize = MediaQuery.of(context).size.width / 2.5;
    return Scaffold(
      appBar: PrettyAppBar(
        titleText: 'Profile',
        actions: [
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 15, 8),
              child: Text('Settings', style: smallTextStyle),
            ),
            onTap: () => Navigator.of(context).pushNamed(RouteGenerator.settingsScreen),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: imageSize,
                height: imageSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: const [
                    BoxShadow(
                      color: shadowColor,
                      blurRadius: 5,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: _displaySetOrDefaultImage(appUser.imageUrl),
              ),
              const SizedBox(height: 15),
              Text(appUser.fullName ?? appUser.username!, style: titleTextStyle),
              const SizedBox(height: 10),
              const Text('My photos', style: standardTextStyle),
              const SizedBox(height: 25),
              Expanded(child: UserGallery(userId: appUser.userId!)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _displaySetOrDefaultImage(String? imageUrl) => imageUrl != null
      ? CircleAvatar(foregroundImage: NetworkImage(imageUrl), radius: 70)
      : const CircleAvatar(backgroundImage: AssetImage('assets/images/default_profile.png'), radius: 70);
}
