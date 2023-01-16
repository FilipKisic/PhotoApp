import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_app/di.dart';
import 'package:photo_app/presentation/routes/route_generator.dart';
import 'package:photo_app/presentation/style/pallete.dart';
import 'package:photo_app/presentation/style/text_style.dart';
import 'package:photo_app/presentation/widget/common/buttons/pretty_action_button.dart';
import 'package:photo_app/presentation/widget/common/pretty_app_bar.dart';

class PickImageScreen extends ConsumerStatefulWidget {
  const PickImageScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PickImageScreenState();
}

class _PickImageScreenState extends ConsumerState<PickImageScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final state = ref.watch(newPostStateNotifier);
    return Scaffold(
      appBar: PrettyAppBar(
        titleText: 'Pick photo',
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
          child: GestureDetector(
            child: const Text('Back', style: smallTextStyle),
            onTap: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              state.when(
                loading: () => const Expanded(child: Center(child: CircularProgressIndicator.adaptive())),
                empty: () => Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Image.asset('assets/images/no_image.png'),
                      ),
                      const Spacer(),
                      PrettyActionButton.text(
                        onTapHandler: _pickImageFromGallery,
                        label: 'Pick image from gallery',
                      ),
                    ],
                  ),
                ),
                error: (failure) => Center(
                  child: Expanded(
                    child: Column(
                      children: [
                        Image.asset('assets/images/no_image.png'),
                        const SizedBox(height: 20),
                        Text(failure.message, style: standardTextStyle),
                        const Spacer(),
                        PrettyActionButton.text(
                          onTapHandler: _pickImageFromGallery,
                          label: 'Pick image from gallery',
                        ),
                      ],
                    ),
                  ),
                ),
                loaded: (selectedImage) => Expanded(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 5),
                              blurRadius: 5,
                              color: shadowColor,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(
                            selectedImage,
                            fit: BoxFit.cover,
                            height: screenHeight * 0.7,
                          ),
                        ),
                      ),
                      const Spacer(),
                      PrettyActionButton.text(
                        onTapHandler: _proceedToDetails,
                        label: 'Post Details',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _pickImageFromGallery() => ref.read(newPostStateNotifier.notifier).chooseImage();

  void _proceedToDetails() => Navigator.pushNamed(context, RouteGenerator.addDescriptionScreen);
}
