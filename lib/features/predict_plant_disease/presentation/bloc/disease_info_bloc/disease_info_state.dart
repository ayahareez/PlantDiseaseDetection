part of 'disease_info_bloc.dart';

abstract class DiseaseInfoState extends Equatable {
  const DiseaseInfoState();

  @override
  List<Object> get props => [];
}

class DiseaseInfoInitial extends DiseaseInfoState {

}
class LoadingDiseaseInfoState extends DiseaseInfoState {}

class LoadedDiseaseInfoState extends DiseaseInfoState {
  final DiseaseInformation diseaseInformation;

  const LoadedDiseaseInfoState({required this.diseaseInformation});


  @override
  List<Object> get props => [diseaseInformation];
}

class ErrorDiseaseInfoState extends DiseaseInfoState {
  final String message;

  const ErrorDiseaseInfoState({required this.message});

  @override
  List<Object> get props => [message];
}
