part of 'disease_info_bloc.dart';

abstract class DiseaseInfoEvent extends Equatable {
  const DiseaseInfoEvent();
  @override
  List<Object> get props => [];
}
class GetDiseaseInfo extends DiseaseInfoEvent {
  final DiseaseInformation diseaseInformation ;

  const GetDiseaseInfo({required this.diseaseInformation});


}
