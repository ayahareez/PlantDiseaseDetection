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
      print("ayaaaaaaaaaaaaaaaa");
      // final filteredDiseaseInfo = diseaseInfo
      //     .where((element) =>
      //         element.diseaseName == disease.className &&
      //         element.plantCategory == disease.plantName)
      //     .toList();
      // print(filteredDiseaseInfo);
      // print(diseaseInfo.where((element) =>
      //     element.diseaseName == disease.className &&
      //     element.plantCategory == disease.plantName));
      DiseaseInformationModel diseaseInformationModel = diseaseInfo
          .where((element) =>
              element.diseaseName == disease.className &&
              element.plantCategory == disease.plantName)
          .toList()[0];
      // DiseaseInformationModel(
      //     diseaseOverview:
      //     'Late blight is a devastating potato disease caused by the oomycete pathogen Phytophthora infestans.Infamous for its role in the Irish Potato Famine in the 19th century.Flourishes in cool, moist conditions.',
      //     diseaseCauses:
      //     'Pathogen Survival: Spores survive in infected plant debris and can spread rapidly.Weather Conditions: Thrives in cool, wet weather, especially during periods of high humidity.',
      //     diseasePrevention:
      //     'Resistant Varieties: Plant potato varieties with resistance to late blight.Fungicides: Regular applications of fungicides, especially during periods of high disease pressure.Spacing and Ventilation: Proper plant spacing and ventilation to reduce humidity around plants.Early Detection: Regularly inspect plants and act promptly if symptoms are observed.',
      //     diseaseRecovery:
      //     'Pruning and Removal: Trim affected foliage and remove infected plant parts to prevent further spread.Copper-Based Fungicides: Application of copper-based fungicides to slow down the disease progression.Cultural Practices: Ensure proper soil drainage and avoid excessive watering.Post-Harvest Inspection: Carefully inspect harvested tubers, and discard any showing signs of infection.',
      //     diseaseName: 'Late Blight',
      //     plantCategory: 'potato');

      print(diseaseInformationModel);
      // DiseaseInformationModel? diseaseInformationModel;
      // for (int i = 0; i < diseaseInfo.length - 1; i++) {
      //   if (disease.plantName == diseaseInfo[i].plantCategory &&
      //       disease.className == diseaseInfo[i].diseaseName) {
      //     diseaseInformationModel = diseaseInfo[i];
      //   }
      // }
      return Right(diseaseInformationModel);
    } on EmptyListException {
      return Left(EmptyListFailure());
    }
  }
}