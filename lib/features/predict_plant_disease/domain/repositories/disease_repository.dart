

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:plant_disease/features/predict_plant_disease/domain/entities/disease.dart';

import '../../../../core/errors/failures.dart';

abstract class DiseaseRepository {
  Future<Either<Failure, Disease>> addPhotoToPredict(
      File file, String plantName);
}