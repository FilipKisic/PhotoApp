import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_app/di.dart';
import 'package:photo_app/domain/entity/post.dart';
import 'package:photo_app/presentation/routes/route_generator.dart';
import 'package:photo_app/presentation/style/pallete.dart';
import 'package:photo_app/presentation/style/text_style.dart';

class UserPost extends ConsumerWidget {
  final Post post;

  const UserPost({super.key, required this.post});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageSize = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => _selectPost(context, ref),
      child: Stack(
        children: [
          Container(
            width: imageSize,
            height: imageSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: shadowColor,
                  blurRadius: 5,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Hero(
                tag: post.heroTag!,
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(post.imageUrl),
                  height: imageSize,
                  width: imageSize,
                ),
              ),
            ),
          ),
          SizedBox(
            height: imageSize,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                  decoration: BoxDecoration(
                    color: postBackgroundColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(post.user!.username, style: postTextStyle),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                  decoration: BoxDecoration(
                    color: postBackgroundColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (post.description != null) Text(post.description!, style: postTextStyle),
                      if (post.hashtags != null) Text(post.hashtagsAsSingleString, style: hashtagTextStyle),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _selectPost(final BuildContext context, final WidgetRef ref) {
    ref.read(selectedPostChangeProvider).selectPost(post);
    Navigator.of(context).pushNamed(RouteGenerator.postDetailsScreen);
  }
}
