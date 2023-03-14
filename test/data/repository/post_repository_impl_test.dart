import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:photo_app/app/error/failure.dart';
import 'package:photo_app/data/source_remote/post/post_api.dart';
import 'package:photo_app/domain/entity/post.dart';

import 'post_repository_impl_test.mocks.dart';

class FakePostApi extends Mock implements PostApi {}

@GenerateMocks([FakePostApi])
void main() {
  late MockFakePostApi postApi;

  setUp(() {
    postApi = MockFakePostApi();
  });

  final Post post = Post(
    createDate: Timestamp.fromDate(DateTime(2023, 3, 11, 12, 0)),
    imageUrl: 'imageUrl',
    userId: 'userId',
  );
  final List<Post> postList = [post];

  test('should get all posts', () async {
    //arrange
    when(postApi.getAllPosts()).thenAnswer((realInvocation) async => Right(postList));
    //act
    final result = await postApi.getAllPosts();
    //assert
    result.fold(
      (failure) => null,
      (success) {
        verify(postApi.getAllPosts());
        expect(success, postList);
      },
    );
  });

  test('should to get user posts', () async {
    //arrange
    when(postApi.getUserPosts(any)).thenAnswer((realInvocation) async => Right(postList));
    //act
    final result = await postApi.getUserPosts('userId');
    //assert
    verify(postApi.getUserPosts('userId'));
    expect(result, equals(Right(postList)));
  });

  test('should create user post', () async {
    //arrange
    when(postApi.uploadNewPost(post)).thenAnswer((realInvocation) async => const Right(null));
    //act
    final result = await postApi.uploadNewPost(post);
    //assert
    verify(postApi.uploadNewPost(post));
    expect(result, const Right(null));
  });
}
