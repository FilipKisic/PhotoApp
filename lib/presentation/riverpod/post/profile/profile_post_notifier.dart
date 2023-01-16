import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_app/domain/usecase/post/get_user_posts_use_case.dart';
import 'package:photo_app/presentation/riverpod/post/profile/state/profile_post_state.dart';

class ProfilePostNotifier extends StateNotifier<ProfilePostState> {
  final GetUserPostsUseCase _getUserPostsUseCase;

  ProfilePostNotifier(this._getUserPostsUseCase, userId) : super(const ProfilePostState.loading()) {
    _getUserPosts(userId);
  }

  Future<void> _getUserPosts(final String userId) async {
    state = const ProfilePostState.loading();
    final result = await _getUserPostsUseCase.getUserPosts(userId);

    result.fold(
      (failure) => state = ProfilePostState.error(failure),
      (postList) => postList.isEmpty ? state = const ProfilePostState.empty() : state = ProfilePostState.loaded(postList),
    );
  }
}
