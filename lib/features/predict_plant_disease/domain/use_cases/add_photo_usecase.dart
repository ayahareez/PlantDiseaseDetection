
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plant_disease/features/predict_plant_disease/domain/entities/disease.dart';
import 'package:plant_disease/features/predict_plant_disease/domain/repositories/disease_repository.dart';

import '../../../../core/errors/failures.dart';

class AddPhotoUC {
  final DiseaseRepository diseaseRepository;

  AddPhotoUC({required this.diseaseRepository});
  Future<Either<Failure, Disease>> call(File file, String plantName) {
    return diseaseRepository.addPhotoToPredict(file, plantName);
  }
}