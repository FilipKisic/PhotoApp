import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:photo_app/domain/entity/app_user.dart';
import 'package:photo_app/app/error/failure.dart';

class AuthApi {
  final firebaseInstance = FirebaseAuth.instance;

  Future<Either<Failure, AppUser>> loginWithEmailAndPassword(final String email, final String password) async {
    try {
      final credential = await firebaseInstance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(
        AppUser(
          userId: credential.user?.uid,
          username: credential.additionalUserInfo?.username,
          fullName: credential.user?.email,
          email: credential.user?.email,
        ),
      );
    } catch (_) {
      return const Left(Failure.authError('Invalid email or password.'));
    }
  }

  Future<Either<Failure, AppUser>> registerWithEmailAndPassword(final String email, final String password) async {
    try {
      final credential = await firebaseInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(
        AppUser(
          userId: credential.user?.uid,
          username: credential.user?.email,
          fullName: credential.user?.email,
          email: credential.user?.email,
        ),
      );
    } catch (_) {
      return const Left(Failure.authError('An error occured while sign up process...'));
    }
  }

  Future<Either<Failure, AppUser>> loginWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleSignInAccount = await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final googleSignInAuthentication = await googleSignInAccount.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        await firebaseInstance.signInWithCredential(credential);
      } on FirebaseAuthException catch (_) {
        return const Left(Failure.authError('Invalid credentials.'));
      } catch (_) {
        return const Left(Failure.authError('There was an error...'));
      }
    }
    final appUser = AppUser(
      userId: googleSignInAccount?.id,
      username: googleSignInAccount?.email,
      fullName: googleSignInAccount?.displayName,
      email: googleSignInAccount?.email,
      imageUrl: googleSignInAccount?.photoUrl,
    );
    return Right(appUser);
  }

  bool isUserLoggedIn() => firebaseInstance.currentUser != null;

  String? get currentUserId => firebaseInstance.currentUser?.uid;
}
