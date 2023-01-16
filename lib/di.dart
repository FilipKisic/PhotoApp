import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_app/data/device/photo_manager_impl.dart';
import 'package:photo_app/data/repository/post_repository_impl.dart';
import 'package:photo_app/data/repository/user_repository_impl.dart';
import 'package:photo_app/data/source_remote/auth/auth_api.dart';
import 'package:photo_app/data/source_remote/post/firebase_storage_api.dart';
import 'package:photo_app/data/source_remote/post/post_api.dart';
import 'package:photo_app/data/source_remote/user/user_api.dart';
import 'package:photo_app/domain/manager/photo_manager.dart';
import 'package:photo_app/domain/repository/post_repository.dart';
import 'package:photo_app/domain/repository/user_repository.dart';
import 'package:photo_app/domain/usecase/auth/login_user_use_case.dart';
import 'package:photo_app/domain/usecase/auth/register_user_use_case.dart';
import 'package:photo_app/domain/usecase/post/create_new_post_use_case.dart';
import 'package:photo_app/domain/usecase/post/get_all_posts_use_case.dart';
import 'package:photo_app/domain/usecase/post/get_user_posts_use_case.dart';
import 'package:photo_app/domain/usecase/post/pick_images_from_gallery_use_case.dart';
import 'package:photo_app/domain/usecase/user/select_plan_use_case.dart';
import 'package:photo_app/presentation/riverpod/post/feed/post_feed_notifier.dart';
import 'package:photo_app/presentation/riverpod/post/feed/state/post_feed_state.dart';
import 'package:photo_app/presentation/riverpod/post/new/new_post_notifier.dart';
import 'package:photo_app/presentation/riverpod/post/new/state/new_post_state.dart';
import 'package:photo_app/presentation/riverpod/post/profile/profile_post_notifier.dart';
import 'package:photo_app/presentation/riverpod/post/profile/state/profile_post_state.dart';
import 'package:photo_app/presentation/riverpod/post/selected_post_provider.dart';
import 'package:photo_app/presentation/riverpod/user/user_notifier.dart';

//* API *//
final authApiProvider = Provider<AuthApi>((ref) => AuthApi());
final postApiProvider = Provider<PostApi>((ref) => PostApi());
final userApiProvider = Provider<UserApi>((ref) => UserApi());
final firebaseStorageApiProvider = Provider<FirebaseStorageApi>((ref) => FirebaseStorageApi());

//* REPOSITORY *//
final userRepositoryProvider = Provider<UserRepository>(
  (ref) => UserRepositoryImpl(
    ref.read(authApiProvider),
    ref.read(userApiProvider),
    ref.read(firebaseStorageApiProvider),
  ),
);

final postRepositoryProvider = Provider<PostRepository>(
  (ref) => PostRepositoryImpl(
    ref.read(postApiProvider),
    ref.read(firebaseStorageApiProvider),
  ),
);

final photoManagerProvider = Provider<PhotoManager>(
  (ref) => PhotoManagerImpl(),
);

//* USE CASE *//
final loginUserUseCase = Provider<LoginUserUseCase>(
  (ref) => LoginUserUseCase(ref.read(userRepositoryProvider)),
);

final registerUseCase = Provider<RegisterUserUseCase>(
  (ref) => RegisterUserUseCase(ref.read(userRepositoryProvider)),
);

final getAllPostsUseCaseProvider = Provider<GetAllPostsUseCase>(
  (ref) => GetAllPostsUseCase(
    ref.read(postRepositoryProvider),
    ref.read(userRepositoryProvider),
  ),
);

final selectPlanUseCaseProvider = Provider<SelectPlanUseCase>(
  (ref) => SelectPlanUseCase(ref.read(userRepositoryProvider)),
);

final pickImageFromGalleryUseCaseProvider = Provider<PickImageFromGalleryUseCase>(
  (ref) => PickImageFromGalleryUseCase(ref.read(photoManagerProvider)),
);

final createNewPostUseCaseProvider = Provider<CreateNewPostUseCase>(
  (ref) => CreateNewPostUseCase(ref.read(postRepositoryProvider)),
);

final getUserPostsUseCaseProvider = Provider<GetUserPostsUseCase>(
  (ref) => GetUserPostsUseCase(ref.read(postRepositoryProvider)),
);

//* PROVIDER *//
final userNotifierChangeProvider = ChangeNotifierProvider<UserNotifier>(
  (ref) => UserNotifier(
    ref.read(loginUserUseCase),
    ref.read(registerUseCase),
    ref.read(selectPlanUseCaseProvider),
  ),
);

final postFeedStateNotifier = StateNotifierProvider.autoDispose<PostFeedNotifier, PostFeedState>(
  (ref) => PostFeedNotifier(ref.read(getAllPostsUseCaseProvider)),
);

final selectedPostChangeProvider = ChangeNotifierProvider<SelectedPostProvider>(
  (_) => SelectedPostProvider(),
);

final newPostStateNotifier = StateNotifierProvider.autoDispose<NewPostNotifier, NewPostState>(
  (ref) => NewPostNotifier(
    ref.read(pickImageFromGalleryUseCaseProvider),
    ref.read(createNewPostUseCaseProvider),
  ),
);

final profilePostStateNotifier = StateNotifierProvider.autoDispose.family<ProfilePostNotifier, ProfilePostState, String>(
  (ref, userId) => ProfilePostNotifier(
    ref.read(getUserPostsUseCaseProvider),
    userId,
  ),
);
