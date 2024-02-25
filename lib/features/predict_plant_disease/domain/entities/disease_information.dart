import 'package:equatable/equatable.dart';

class DiseaseInformation extends Equatable {
  final String diseaseOverview,
      diseaseCauses,
      diseasePrevention,
      diseaseRecovery,
      diseaseName,
      diseaseCategory;

  const DiseaseInformation(
      {required this.diseaseOverview,
      required this.diseaseCauses,
      required this.diseasePrevention,
      required this.diseaseRecovery,
      required this.diseaseName,
      required this.diseaseCategory});

  @override
  List<Object?> get props => throw UnimplementedError();
}
