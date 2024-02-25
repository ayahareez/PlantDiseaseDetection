import 'package:plant_disease/features/predict_plant_disease/domain/entities/disease_information.dart';

class DiseaseInformationModel extends DiseaseInformation {
  const DiseaseInformationModel(
      {required super.diseaseOverview,
      required super.diseaseCauses,
      required super.diseasePrevention,
      required super.diseaseRecovery,
      required super.diseaseName,
      required super.diseaseCategory});

  factory DiseaseInformationModel.fromMap(Map<String, dynamic> map) {
    return DiseaseInformationModel(
        diseaseOverview: map['diseaseOverview'],
        diseaseCauses: map['diseaseCauses'],
        diseasePrevention: map['diseasePrevention'],
        diseaseRecovery: map['diseaseRecovery'],
        diseaseName: map['diseaseName'],
        diseaseCategory: map['diseaseCategory']);
  }

  Map<String, dynamic> toMap() {
    return {
      'diseaseOverview': diseaseOverview,
      'diseaseCauses': diseaseCauses,
      'diseasePrevention': diseasePrevention,
      'diseaseRecovery': diseaseRecovery,
      'diseaseName': diseaseName,
      'diseaseCategory': diseaseCategory
    };
  }
}
