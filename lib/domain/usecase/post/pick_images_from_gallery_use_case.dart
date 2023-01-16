import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:photo_app/app/error/failure.dart';
import 'package:photo_app/domain/manager/photo_manager.dart';

class PickImageFromGalleryUseCase {
  final PhotoManager _photoManager;

  const PickImageFromGalleryUseCase(this._photoManager);

  Future<Either<Failure, File?>> chooseImages() async => await _photoManager.chooseImages();
}