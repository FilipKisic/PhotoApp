import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_app/di.dart';
import 'package:photo_app/domain/entity/post.dart';
import 'package:photo_app/presentation/style/pallete.dart';
import 'package:photo_app/presentation/style/text_style.dart';

class UserGallery extends ConsumerWidget {
  final String userId;

  const UserGallery({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profilePostStateNotifier(userId));
    return state.when(
      loading: () => const Center(child: CircularProgressIndicator.adaptive(backgroundColor: primaryColor)),
      empty: () => const Center(child: Text('No posts yet...', style: titleTextStyle)),
      error: (error) => Center(child: Text(error.message, style: titleTextStyle)),
      loaded: (posts) => GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        shrinkWrap: true,
        itemCount: posts.length,
        itemBuilder: (context, index) => GalleryImage(post: posts[index]),
      ),
    );
  }
}

class GalleryImage extends StatelessWidget {
  final Post post;

  const GalleryImage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Image(
          image: NetworkImage(post.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
