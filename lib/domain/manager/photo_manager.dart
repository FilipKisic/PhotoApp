import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:photo_app/app/error/failure.dart';

abstract class PhotoManager {
  Future<Either<Failure, File?>> chooseImages();
}