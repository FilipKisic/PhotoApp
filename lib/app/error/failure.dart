import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.authError(String message) = _AuthError;
  const factory Failure.generalError(String message) = _General;
  const factory Failure.galleryError(String message) = _Gallery;
}
