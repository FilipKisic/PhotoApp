import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_app/di.dart';
import 'package:photo_app/domain/entity/post.dart';
import 'package:photo_app/presentation/style/pallete.dart';
import 'package:photo_app/presentation/style/text_style.dart';
import 'package:photo_app/presentation/widget/common/buttons/pretty_icon_button.dart';
import 'package:photo_app/presentation/widget/common/pretty_app_bar.dart';

class PostDetailsScreen extends ConsumerWidget {
  const PostDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final post = ref.read(selectedPostChangeProvider).selectedPost;
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PrettyAppBar(
        titleText: 'Post details',
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
          child: GestureDetector(
            child: const Text('Back', style: smallTextStyle),
            onTap: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: post!.heroTag!,
              child: Image(image: NetworkImage(post.imageUrl), width: screenSize.width, height: screenSize.height / 2, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: PostDetails(post: post),
            )
          ],
        ),
      ),
    );
  }
}

class PostDetails extends StatelessWidget {
  final Post post;
  const PostDetails({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: shadowColor,
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: post.user!.profileImageUrl == null
                    ? Image.asset('assets/images/default_profile.png', fit: BoxFit.cover)
                    : Image.network(post.user!.profileImageUrl!, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 10),
            Text(post.user!.username, style: smallTextStyle),
            const Spacer(),
            const PrettyIconButton(icon: CupertinoIcons.down_arrow),
          ],
        ),
        const SizedBox(height: 15),
        if (post.description != null) Text(post.description!, style: smallTextStyle),
        if (post.hashtags != null && post.hashtags!.isNotEmpty)
          Text(post.hashtagsAsSingleString, style: hashtagTextStyle.copyWith(color: textColor)),
        Text(post.formattedCreateDate, style: dateTextStyle),
      ],
    );
  }
}
