import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photo_app/domain/entity/post.dart';
import 'package:photo_app/app/error/failure.dart';

part 'post_feed_state.freezed.dart';

@freezed
class PostFeedState with _$PostFeedState {
  const factory PostFeedState.loading() = _Loading;
  const factory PostFeedState.empty() = _Empty;
  const factory PostFeedState.loaded(List<Post> posts) = _Loaded;
  const factory PostFeedState.error(Failure failure) = _Error;
}