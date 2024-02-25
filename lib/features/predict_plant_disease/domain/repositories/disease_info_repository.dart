
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/disease_information.dart';

abstract class DiseaseInfoRepository {
  Future<Either<Failure, DiseaseInformation>> getDiseaseInfo(String diseaseName);
}