import 'package:dartz/dartz.dart';
import 'package:plant_disease/features/predict_plant_disease/domain/entities/disease.dart';
import 'package:plant_disease/features/predict_plant_disease/domain/repositories/disease_repository.dart';

import '../../../../core/errors/failures.dart';

class AddPhotoUC {
  final DiseaseRepository diseaseRepository;

  AddPhotoUC({required this.diseaseRepository});
  // Either<Failure, Disease> call(Disease disease) {
  //   return diseaseRepository.addPhotoToPredict();
  // }
}