import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_app/domain/usecase/post/create_new_post_use_case.dart';
import 'package:photo_app/domain/usecase/post/pick_images_from_gallery_use_case.dart';
import 'package:photo_app/presentation/riverpod/post/new/state/new_post_state.dart';

class NewPostNotifier extends StateNotifier<NewPostState> {
  final PickImageFromGalleryUseCase _chooseImageUseCase;
  final CreateNewPostUseCase _createNewPostUseCase;
  File? _newImage;

  NewPostNotifier(this._chooseImageUseCase, this._createNewPostUseCase) : super(const NewPostState.empty());

  Future<void> chooseImage() async {
    state = const NewPostState.loading();
    final result = await _chooseImageUseCase.chooseImages();

    result.fold(
      (failure) {
        _newImage = null;
        state = NewPostState.error(failure);
      },
      (selectedImage) {
        if (selectedImage != null) {
          _newImage = selectedImage;
          state = NewPostState.loaded(selectedImage);
        } else {
          _newImage = null;
          state = const NewPostState.empty();
        }
      },
    );
  }

  File? get newImage => _newImage;

  Future<void> createNewPost(final String description, final List<String> hashtags, final String userId) async =>
      await _createNewPostUseCase.createNewPost(_newImage!, description, hashtags, userId);
}
