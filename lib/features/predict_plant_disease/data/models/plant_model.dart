import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plant_disease/features/predict_plant_disease/domain/entities/plant.dart';

class PlantModel extends Plant {
  PlantModel(
      {required super.plantName, required super.id, required super.image});

  factory PlantModel.fromDoc(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    return PlantModel(
        plantName: doc['plantName'], id: doc['id'], image: doc['image']);
  }

  Map<String, dynamic> toMap() {
    return {' plantName': plantName, 'image': image};
  }
}