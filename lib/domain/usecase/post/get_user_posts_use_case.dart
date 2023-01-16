import 'package:dartz/dartz.dart';
import 'package:photo_app/app/error/failure.dart';
import 'package:photo_app/domain/entity/post.dart';
import 'package:photo_app/domain/repository/post_repository.dart';

class GetUserPostsUseCase {
  final PostRepository _postRepository;

  const GetUserPostsUseCase(this._postRepository);

  Future<Either<Failure, List<Post>>> getUserPosts(final String userId) async => await _postRepository.getUserPosts(userId);
}
