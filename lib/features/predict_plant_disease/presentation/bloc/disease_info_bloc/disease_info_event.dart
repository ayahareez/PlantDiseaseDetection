part of 'disease_info_bloc.dart';

abstract class DiseaseInfoEvent extends Equatable {
  const DiseaseInfoEvent();
  @override
  List<Object> get props => [];
}
class GetDiseaseInfo extends DiseaseInfoEvent {
  final String diseaseName ;

  GetDiseaseInfo({required this.diseaseName});
}
