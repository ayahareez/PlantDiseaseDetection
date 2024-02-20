import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:plant_disease/features/predict_plant_disease/data/models/disease_model.dart';
import 'package:plant_disease/features/predict_plant_disease/domain/entities/disease.dart';

import '../../../../core/errors/exceptions.dart';

abstract class DiseaseRemoteDs {
  Future<Disease> addPhoto(File imageFile, String plantName);
}

const BASE_URL = "http://localhost:8000/predict?name=";

class DiseaseRemoteDsImpl implements DiseaseRemoteDs {
  final http.Client client;

  DiseaseRemoteDsImpl({required this.client});

  @override
  Future<Disease> addPhoto(File imageFile, String plantName) async {
    // Create a multipart request
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(BASE_URL + plantName),
    );

    // Add the image file to the request
    request.files.add(
      http.MultipartFile(
        'file',
        imageFile.readAsBytes().asStream(),
        imageFile.lengthSync(),
        filename: imageFile.path.split('/').last,
       // contentType: MediaType('image', 'jpeg'), // Adjust the content type accordingly
      ),
    );

    // Send the request and get the response
    final response = await request.send();

    // Check the response status code
    if (response.statusCode > 199 && response.statusCode < 300) {
      // Decode the JSON response
      Map<String, dynamic> decodedJson = jsonDecode(await response.stream.bytesToString());
      DiseaseModel diseaseModel = DiseaseModel.fromMap(decodedJson);
      return Future.value(diseaseModel);
    } else {
      throw ServerException();
    }
  }
}
