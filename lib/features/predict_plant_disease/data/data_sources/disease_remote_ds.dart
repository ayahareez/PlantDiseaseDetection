import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:plant_disease/features/predict_plant_disease/data/models/disease_model.dart';
import 'package:plant_disease/features/predict_plant_disease/domain/entities/disease.dart';
import 'package:plant_disease/features/predict_plant_disease/domain/entities/plant.dart';

import '../../../../core/errors/exceptions.dart';

abstract class DiseaseRemoteDs {
  Future<Disease> addPhoto(String imageUrl, String plantName);
}

const BASE_URL = "http://localhost:8000/predict?name=";

class DiseaseRemoteDsImpl implements DiseaseRemoteDs {
  final http.Client client;

  DiseaseRemoteDsImpl({required this.client});
  @override
  Future<Disease> addPhoto(String imageUrl, String plantName) async {
    final response =
        await client.post(Uri.parse(BASE_URL + "$plantName"), body: imageUrl);
    if (response.statusCode > 199 && response.statusCode < 300) {
      Map<String, dynamic> decodedJson = jsonDecode(response.body);
      DiseaseModel diseaseModel = DiseaseModel.fromMap(decodedJson);
      return Future.value(diseaseModel);
    } else {
      throw ServerException();
    }
  }
}