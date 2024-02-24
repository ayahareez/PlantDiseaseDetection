import 'package:equatable/equatable.dart';

class DiseaseInformation extends Equatable {
  final String diseaseData, diseaseName , diseaseCategory;

  const DiseaseInformation(
      {required this.diseaseData, required this.diseaseName , required this.diseaseCategory});

  @override
  List<Object?> get props => throw UnimplementedError();
}
