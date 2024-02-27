import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:plant_disease/core/errors/failures.dart';
import 'package:plant_disease/core/networks/network_info.dart';
import 'package:plant_disease/features/predict_plant_disease/domain/entities/disease.dart';
import 'package:plant_disease/features/predict_plant_disease/domain/repositories/disease_repository.dart';
import '../../../../core/errors/exceptions.dart';
import '../data_sources/remote_ds/disease_remote_ds.dart';

class DiseaseRepositoryImpl implements DiseaseRepository {
  final NetworkInfo networkInfo;
  final DiseaseRemoteDs diseaseRemoteDs;
  DiseaseRepositoryImpl(
      {required this.networkInfo, required this.diseaseRemoteDs});
  @override
  Future<Either<Failure, Disease>> addPhotoToPredict(
      File imageUrl, String plantName) async {
    if (await networkInfo.isConnected) {
      try {
        final Disease disease =
            await diseaseRemoteDs.addPhoto(imageUrl, plantName);
        return Right(disease);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}