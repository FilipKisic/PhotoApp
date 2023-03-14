import 'dart:io';

import 'package:photo_app/data/source_remote/post/firebase_storage_api.dart';
import 'package:photo_app/data/source_remote/post/post_api.dart';
import 'package:photo_app/domain/entity/post.dart';
import 'package:dartz/dartz.dart';
import 'package:photo_app/domain/repository/post_repository.dart';
import 'package:photo_app/app/error/failure.dart';

class PostRepositoryImpl implements PostRepository {
  final PostApi _api;
  final FirebaseStorageApi _firebaseStorageApi;

  const PostRepositoryImpl(this._api, this._firebaseStorageApi);

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() => _api.getAllPosts();

  @override
  Future<Either<Failure, void>> createPost(final Post newPost) => _api.uploadNewPost(newPost);

  @override
  Future<String> uploadPostImage(final File image) => _firebaseStorageApi.uploadImage(image);

  @override
  Future<Either<Failure, List<Post>>> getUserPosts(final String userId) =>
      _api.getUserPosts(userId);
}
