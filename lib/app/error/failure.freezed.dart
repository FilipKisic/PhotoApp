// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Failure {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) authError,
    required TResult Function(String message) generalError,
    required TResult Function(String message) galleryError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? authError,
    TResult? Function(String message)? generalError,
    TResult? Function(String message)? galleryError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? authError,
    TResult Function(String message)? generalError,
    TResult Function(String message)? galleryError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthError value) authError,
    required TResult Function(_General value) generalError,
    required TResult Function(_Gallery value) galleryError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthError value)? authError,
    TResult? Function(_General value)? generalError,
    TResult? Function(_Gallery value)? galleryError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthError value)? authError,
    TResult Function(_General value)? generalError,
    TResult Function(_Gallery value)? galleryError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FailureCopyWith<Failure> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthErrorCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$$_AuthErrorCopyWith(
          _$_AuthError value, $Res Function(_$_AuthError) then) =
      __$$_AuthErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_AuthErrorCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$_AuthError>
    implements _$$_AuthErrorCopyWith<$Res> {
  __$$_AuthErrorCopyWithImpl(
      _$_AuthError _value, $Res Function(_$_AuthError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_AuthError(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AuthError implements _AuthError {
  const _$_AuthError(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.authError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthErrorCopyWith<_$_AuthError> get copyWith =>
      __$$_AuthErrorCopyWithImpl<_$_AuthError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) authError,
    required TResult Function(String message) generalError,
    required TResult Function(String message) galleryError,
  }) {
    return authError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? authError,
    TResult? Function(String message)? generalError,
    TResult? Function(String message)? galleryError,
  }) {
    return authError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? authError,
    TResult Function(String message)? generalError,
    TResult Function(String message)? galleryError,
    required TResult orElse(),
  }) {
    if (authError != null) {
      return authError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthError value) authError,
    required TResult Function(_General value) generalError,
    required TResult Function(_Gallery value) galleryError,
  }) {
    return authError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthError value)? authError,
    TResult? Function(_General value)? generalError,
    TResult? Function(_Gallery value)? galleryError,
  }) {
    return authError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthError value)? authError,
    TResult Function(_General value)? generalError,
    TResult Function(_Gallery value)? galleryError,
    required TResult orElse(),
  }) {
    if (authError != null) {
      return authError(this);
    }
    return orElse();
  }
}

abstract class _AuthError implements Failure {
  const factory _AuthError(final String message) = _$_AuthError;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_AuthErrorCopyWith<_$_AuthError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GeneralCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$$_GeneralCopyWith(
          _$_General value, $Res Function(_$_General) then) =
      __$$_GeneralCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_GeneralCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$_General>
    implements _$$_GeneralCopyWith<$Res> {
  __$$_GeneralCopyWithImpl(_$_General _value, $Res Function(_$_General) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_General(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_General implements _General {
  const _$_General(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.generalError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_General &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GeneralCopyWith<_$_General> get copyWith =>
      __$$_GeneralCopyWithImpl<_$_General>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) authError,
    required TResult Function(String message) generalError,
    required TResult Function(String message) galleryError,
  }) {
    return generalError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? authError,
    TResult? Function(String message)? generalError,
    TResult? Function(String message)? galleryError,
  }) {
    return generalError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? authError,
    TResult Function(String message)? generalError,
    TResult Function(String message)? galleryError,
    required TResult orElse(),
  }) {
    if (generalError != null) {
      return generalError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthError value) authError,
    required TResult Function(_General value) generalError,
    required TResult Function(_Gallery value) galleryError,
  }) {
    return generalError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthError value)? authError,
    TResult? Function(_General value)? generalError,
    TResult? Function(_Gallery value)? galleryError,
  }) {
    return generalError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthError value)? authError,
    TResult Function(_General value)? generalError,
    TResult Function(_Gallery value)? galleryError,
    required TResult orElse(),
  }) {
    if (generalError != null) {
      return generalError(this);
    }
    return orElse();
  }
}

abstract class _General implements Failure {
  const factory _General(final String message) = _$_General;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_GeneralCopyWith<_$_General> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GalleryCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$$_GalleryCopyWith(
          _$_Gallery value, $Res Function(_$_Gallery) then) =
      __$$_GalleryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_GalleryCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$_Gallery>
    implements _$$_GalleryCopyWith<$Res> {
  __$$_GalleryCopyWithImpl(_$_Gallery _value, $Res Function(_$_Gallery) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_Gallery(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Gallery implements _Gallery {
  const _$_Gallery(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.galleryError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Gallery &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GalleryCopyWith<_$_Gallery> get copyWith =>
      __$$_GalleryCopyWithImpl<_$_Gallery>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) authError,
    required TResult Function(String message) generalError,
    required TResult Function(String message) galleryError,
  }) {
    return galleryError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? authError,
    TResult? Function(String message)? generalError,
    TResult? Function(String message)? galleryError,
  }) {
    return galleryError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? authError,
    TResult Function(String message)? generalError,
    TResult Function(String message)? galleryError,
    required TResult orElse(),
  }) {
    if (galleryError != null) {
      return galleryError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthError value) authError,
    required TResult Function(_General value) generalError,
    required TResult Function(_Gallery value) galleryError,
  }) {
    return galleryError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthError value)? authError,
    TResult? Function(_General value)? generalError,
    TResult? Function(_Gallery value)? galleryError,
  }) {
    return galleryError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthError value)? authError,
    TResult Function(_General value)? generalError,
    TResult Function(_Gallery value)? galleryError,
    required TResult orElse(),
  }) {
    if (galleryError != null) {
      return galleryError(this);
    }
    return orElse();
  }
}

abstract class _Gallery implements Failure {
  const factory _Gallery(final String message) = _$_Gallery;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_GalleryCopyWith<_$_Gallery> get copyWith =>
      throw _privateConstructorUsedError;
}
