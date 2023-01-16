import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_app/di.dart';
import 'package:photo_app/presentation/routes/route_generator.dart';
import 'package:photo_app/presentation/style/text_style.dart';
import 'package:photo_app/presentation/widget/common/buttons/pretty_action_button.dart';
import 'package:photo_app/presentation/widget/common/pretty_app_bar.dart';
import 'package:photo_app/presentation/widget/common/pretty_loading_dialog.dart';
import 'package:photo_app/presentation/widget/common/text_fields/pretty_text_form_field.dart';

class AddPostDescriptionScreen extends ConsumerStatefulWidget {
  const AddPostDescriptionScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddPostDescriptionScreenState();
}

class _AddPostDescriptionScreenState extends ConsumerState<AddPostDescriptionScreen> {
  final TextEditingController _hashtagTextController = TextEditingController();
  final TextEditingController _descriptionTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrettyAppBar(
        titleText: 'Edit post',
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
            children: [
              PrettyTextFormField(
                controller: _hashtagTextController,
                labelText: 'Add hashtags',
                disabledValidation: true,
              ),
              const SizedBox(height: 20),
              PrettyTextFormField(
                controller: _descriptionTextController,
                labelText: 'Description...',
                disabledValidation: true,
                minLines: 3,
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              PrettyActionButton.text(
                onTapHandler: _createNewPost,
                label: 'Finish & Upload',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _createNewPost() async {
    final userId = ref.read(userNotifierChangeProvider.notifier).getCurrentUserId();
    final hashtags = _hashtagTextController.text.split(' ');
    await _uploadPost(hashtags, userId);
    Navigator.popUntil(context, ModalRoute.withName(RouteGenerator.mainScreen));
  }

  Future<void> _uploadPost(List<String> hashtags, String? userId) async {
    PrettyLoadingDialog().show();
    await ref.read(newPostStateNotifier.notifier).createNewPost(_descriptionTextController.text, hashtags, userId!);
    await ref.read(postFeedStateNotifier.notifier).getAllPosts();
    PrettyLoadingDialog().dismiss();
  }
}
