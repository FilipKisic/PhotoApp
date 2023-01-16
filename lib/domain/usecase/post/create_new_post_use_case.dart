import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:photo_app/app/error/failure.dart';
import 'package:photo_app/domain/entity/post.dart';
import 'package:photo_app/domain/repository/post_repository.dart';

class CreateNewPostUseCase {
  final PostRepository _postRepository;

  const CreateNewPostUseCase(this._postRepository);

  Future<Either<Failure, void>> createNewPost(
    final File image,
    final String description,
    final List<String> hashtags,
    final String userId,
  ) async {
    final imageUrl = await _postRepository.uploadPostImage(image);
    final post = Post(
      createDate: Timestamp.now(),
      imageUrl: imageUrl,
      userId: userId,
      description: description,
      hashtags: hashtags,
    );
    return await _postRepository.createPost(post);
  }
}
