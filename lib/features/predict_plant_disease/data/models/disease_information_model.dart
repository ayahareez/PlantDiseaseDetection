import 'package:plant_disease/features/predict_plant_disease/domain/entities/disease_information.dart';

class DiseaseInformationModel extends DiseaseInformation{
  DiseaseInformationModel({required super.diseaseData, required super.diseaseName, required super.diseaseCategory});

  factory DiseaseInformationModel.fromMap(Map<String, dynamic> map) {
    return DiseaseInformationModel(
        diseaseData: map['diseaseData'],
        diseaseName: map['diseaseName'],
        diseaseCategory: map['diseaseCategory']);
  }

  Map<String, dynamic> toMap() {
    return {
      'diseaseData': diseaseData,
      'diseaseName': diseaseName,
      'diseaseCategory':diseaseCategory
    };
  }

}