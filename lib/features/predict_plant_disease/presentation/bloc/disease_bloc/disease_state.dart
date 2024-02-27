part of 'disease_bloc.dart';

abstract class DiseaseState extends Equatable {
  const DiseaseState();

  @override
  List<Object> get props => [];
}

class DiseaseInitial extends DiseaseState {}

class LoadingDiseaseState extends DiseaseState {}

class ErrorDiseaseState extends DiseaseState {
  final String message;

  ErrorDiseaseState({required this.message});

  @override
  List<Object> get props => [message];
}

class MessageDiseaseState extends DiseaseState {
  final String message;

  MessageDiseaseState({required this.message});

  @override
  List<Object> get props => [message];
}

class LoadedDiseaseState extends DiseaseState {
  final Disease disease;

  LoadedDiseaseState({required this.disease});
}