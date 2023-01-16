import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:photo_app/domain/entity/post.dart';
import 'package:photo_app/domain/repository/post_repository.dart';
import 'package:photo_app/domain/repository/user_repository.dart';
import 'package:photo_app/app/error/failure.dart';

class GetAllPostsUseCase {
  final PostRepository _postRepository;
  final UserRepository _userRepository;

  const GetAllPostsUseCase(this._postRepository, this._userRepository);

  Future<Either<Failure, List<Post>>> getAllPosts() async {
    final posts = await _postRepository.getAllPosts();

    return await posts.fold(
      (failure) => Left(failure),
      (postList) async => Right(await _getAdditionalPostData(postList)),
    );
  }

  Future<List<Post>> _getAdditionalPostData(final List<Post> postList) async {
    for (Post post in postList) {
      final postUser = await _getPostUser(post);
      if (postUser?.profileImageUrl != null) {
        postUser?.profileImageUrl = await _getImageNetworkUrl(postUser.profileImageUrl!);
      }

      post.user = postUser;
      post.imageUrl = await _getImageNetworkUrl(post.imageUrl);
    }
    return postList;
  }

  Future<PostUser?> _getPostUser(final Post post) async {
    final user = await _userRepository.getPostUserById(post.userId);
    return user.fold(
      (failure) => null,
      (user) async {
        if (user.profileImageUrl != null) {
          user.profileImageUrl = await _getImageNetworkUrl(user.profileImageUrl!);
        }
        return user;
      },
    );
  }

  Future<String> _getImageNetworkUrl(final String imageUrl) async {
    final url = FirebaseStorage.instance.refFromURL(imageUrl);
    return await url.getDownloadURL();
  }
}
