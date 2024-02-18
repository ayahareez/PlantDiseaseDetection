part of 'disease_bloc.dart';

abstract class DiseaseEvent extends Equatable {
  const DiseaseEvent();
}
class AddPhotoEvent extends DiseaseEvent {
  final String imageUrl;
  final String plantName ;

  AddPhotoEvent({required this.imageUrl, required this.plantName});



  @override
  List<Object> get props => [imageUrl , plantName];
}