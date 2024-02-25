import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/disease_information.dart';
import '../repositories/disease_info_repository.dart';

class GetDiseaseInfoUC{
  final DiseaseInfoRepository diseaseInfoRepository ;

  GetDiseaseInfoUC({required this.diseaseInfoRepository});

  Future<Either<Failure, DiseaseInformation>> call(DiseaseInformation diseaseInformation){
    return diseaseInfoRepository.getDiseaseInfo(diseaseInformation);
  }
}