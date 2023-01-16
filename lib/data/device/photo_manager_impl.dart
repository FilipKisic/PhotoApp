import 'package:flutter/services.dart';
import 'package:photo_app/app/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:photo_app/domain/manager/photo_manager.dart';

class PhotoManagerImpl implements PhotoManager {
  @override
  Future<Either<Failure, File?>> chooseImages() async {
    try {
      final image = await ImagePicker().pickImage(imageQuality: 100, source: ImageSource.gallery);
      if (image != null) { 
        return Right(File(image.path));
      }
      return const Right(null);
    } on PlatformException catch (_) {
      return const Left(Failure.galleryError('There was an error with choosing images...'));
    }
  }
}
