import 'package:dartz/dartz.dart';
import 'package:plant_disease/core/errors/exceptions.dart';

import 'package:plant_disease/core/errors/failures.dart';
import 'package:plant_disease/features/predict_plant_disease/data/models/disease_information_model.dart';

import 'package:plant_disease/features/predict_plant_disease/domain/entities/disease_information.dart';

import '../../domain/entities/disease.dart';
import '../../domain/repositories/disease_info_repository.dart';
import '../data_sources/local_ds/disease_info_local_ds/disease_info_local_ds.dart';

class DiseaseInfoRepositoryImpl implements DiseaseInfoRepository {
  @override
  Future<Either<Failure, DiseaseInformation>> getDiseaseInfo(
      Disease disease) async {
    try {
      DiseaseInformationModel diseaseInformationModel = diseaseInfo
          .where((element) =>
              element.diseaseName == disease.className &&
              element.plantCategory == disease.plantName)
          .toList()[0];
      // DiseaseInformationModel? diseaseInformationModel;
      // for (int i = 0; i < diseaseInfo.length; i++) {
      //   if (disease.plantName == diseaseInfo[i].plantCategory &&
      //       disease.className == diseaseInfo[i].diseaseName) {
      //     diseaseInformationModel = diseaseInfo[i];
      //   }
      // }
      print(diseaseInformationModel ?? 'hi');
      return Right(diseaseInformationModel ??
          DiseaseInformationModel(
              diseaseOverview: 'diseaseOverview',
              diseaseCauses: 'diseaseCauses',
              diseasePrevention: 'diseasePrevention',
              diseaseRecovery: 'diseaseRecovery',
              diseaseName: 'diseaseName',
              plantCategory: 'plantCategory'));
    } on EmptyListException {
      return Left(EmptyListFailure());
    }
  }
}