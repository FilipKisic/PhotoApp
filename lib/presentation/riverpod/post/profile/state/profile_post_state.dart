import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photo_app/app/error/failure.dart';
import 'package:photo_app/domain/entity/post.dart';

part 'profile_post_state.freezed.dart';

@freezed
class ProfilePostState with _$ProfilePostState {
  const factory ProfilePostState.loading() = _Loading;
  const factory ProfilePostState.empty() = _Empty;
  const factory ProfilePostState.loaded(List<Post> posts) = _Loaded;
  const factory ProfilePostState.error(Failure failure) = _Error;
}