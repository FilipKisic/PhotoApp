import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photo_app/app/error/failure.dart';

part 'new_post_state.freezed.dart';

@freezed
class NewPostState with _$NewPostState {
  const factory NewPostState.loading() = _Loading;
  const factory NewPostState.empty() = _Empty;
  const factory NewPostState.loaded(File post) = _Loaded;
  const factory NewPostState.error(Failure failure) = _Error;
}