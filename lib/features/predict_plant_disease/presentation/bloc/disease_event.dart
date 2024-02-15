part of 'disease_bloc.dart';

abstract class DiseaseEvent extends Equatable {
  const DiseaseEvent();
}
class AddPhotoEvent extends DiseaseEvent {
  final File file;
  final String plantName ;

  AddPhotoEvent({required this.file, required this.plantName});



  @override
  List<Object> get props => [file , plantName];
}
