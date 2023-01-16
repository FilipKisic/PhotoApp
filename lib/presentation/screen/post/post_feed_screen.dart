import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_app/di.dart';
import 'package:photo_app/presentation/style/pallete.dart';
import 'package:photo_app/presentation/style/text_style.dart';
import 'package:photo_app/presentation/widget/common/buttons/pretty_option_button.dart';
import 'package:photo_app/presentation/widget/common/pretty_app_bar.dart';
import 'package:photo_app/presentation/widget/common/text_fields/pretty_filter_text_field.dart';
import 'package:photo_app/presentation/widget/post/user_post.dart';

class PostFeedScreen extends ConsumerStatefulWidget {
  const PostFeedScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PostFeedScreenState();
}

class _PostFeedScreenState extends ConsumerState<PostFeedScreen> {
  final TextEditingController _dateTimeFilterController = TextEditingController();
  final TextEditingController _userFilterController = TextEditingController();
  final TextEditingController _hashtagFilterController = TextEditingController();
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(postFeedStateNotifier);
    return Scaffold(
      appBar: PrettyAppBar(
        titleText: 'Home',
        actions: [
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.fromLTRB(8, 10, 15, 8),
              child: Text('Filter', style: smallTextStyle),
            ),
            onTap: () => setState(() => isVisible = !isVisible),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
          child: Column(
            children: [
              AnimatedSize(
                duration: const Duration(milliseconds: 200),
                child: SizedBox(
                  height: isVisible ? null : 0,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        PrettyFilterTextField(
                          controller: _dateTimeFilterController,
                          label: 'Date',
                          isDateField: true,
                        ),
                        const SizedBox(height: 10),
                        PrettyFilterTextField(
                          controller: _userFilterController,
                          label: 'User',
                        ),
                        const SizedBox(height: 10),
                        PrettyFilterTextField(
                          controller: _hashtagFilterController,
                          label: 'Hashtag',
                        ),
                        const SizedBox(height: 10),
                        PrettyOptionButton(
                          isPrimary: true,
                          labelText: 'Apply',
                          onTap: _filterPosts,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              state.when(
                loading: () => const Expanded(child: Center(child: CircularProgressIndicator.adaptive(backgroundColor: primaryColor))),
                error: (failure) => const Expanded(child: Center(child: Text('Error happened...', style: titleTextStyle))),
                empty: () => const Expanded(child: Center(child: Text('No feed...', style: titleTextStyle))),
                loaded: (feed) => Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: feed.length,
                    separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 25),
                    itemBuilder: (context, index) {
                      feed[index].heroTag = 'feedCard$index';
                      return UserPost(post: feed[index]);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _filterPosts() {
    if (_dateTimeFilterController.text.trim().isNotEmpty) log('Will filter by date');
    if (_userFilterController.text.trim().isNotEmpty) log('Will filter by user');
    if (_hashtagFilterController.text.trim().isNotEmpty) log('Will filter by hashtag');
  }
}
