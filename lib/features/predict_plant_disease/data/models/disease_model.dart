import 'package:plant_disease/features/predict_plant_disease/domain/entities/disease.dart';

class DiseaseModel extends Disease {
  const DiseaseModel(
      {required super.className,
      required super.plantName,
      required super.confidence});
  factory DiseaseModel.fromMap(Map<String, dynamic> map) {
    return DiseaseModel(
        confidence: map['confidence'],
        plantName: map['plantName'],
        className: map['className']);
  }

  Map<String, dynamic> toMap() {
    return {
      'confidence': confidence,
      'plantName': plantName,
      'className': className
    };
  }
}