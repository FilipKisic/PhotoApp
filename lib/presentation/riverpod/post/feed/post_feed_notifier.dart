import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_app/domain/usecase/post/get_all_posts_use_case.dart';
import 'package:photo_app/presentation/riverpod/post/feed/state/post_feed_state.dart';

class PostFeedNotifier extends StateNotifier<PostFeedState> {
  final GetAllPostsUseCase _getAllPostsUseCase;

  PostFeedNotifier(this._getAllPostsUseCase) : super(const PostFeedState.loading()) {
    getAllPosts();
  }

  Future<void> getAllPosts() async {
    state = const PostFeedState.loading();
    final result = await _getAllPostsUseCase.getAllPosts();

    result.fold(
      (failure) => state = PostFeedState.error(failure),
      (postList) => postList.isEmpty ? state = const PostFeedState.empty() : state = PostFeedState.loaded(postList),
    );
  }
}
