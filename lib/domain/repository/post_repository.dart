import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:photo_app/domain/entity/post.dart';
import 'package:photo_app/app/error/failure.dart';

abstract class PostRepository {
  Future<Either<Failure, List<Post>>> getAllPosts();
  Future<Either<Failure, void>> createPost(Post post);
  Future<String> uploadPostImage(File image);
  Future<Either<Failure, List<Post>>> getUserPosts(String userId);
}