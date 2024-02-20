import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:plant_disease/features/predict_plant_disease/domain/entities/disease.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/strings/failurs.dart';
import '../../domain/usecases/add_photo_usecase.dart';

part 'disease_event.dart';
part 'disease_state.dart';

class DiseaseBloc extends Bloc<DiseaseEvent, DiseaseState> {
  final AddPhotoUC addPhotoUC;
  DiseaseBloc({required this.addPhotoUC}) : super(DiseaseInitial()) {
    on<DiseaseEvent>((event, emit) async {
      if (event is AddPhotoEvent) {
        emit(LoadingDiseaseState());
        print('from bloc after loading ');
        final failureOrDoneMessage =
            await addPhotoUC(event.imageUrl, event.plantName);
        print('from bloc after loading ');

        emit(
          _eitherDoneMessageOrErrorState(failureOrDoneMessage),
        );
      }
    });
  }
}

DiseaseState _eitherDoneMessageOrErrorState(Either<Failure, Disease> either) {
  return either.fold(
    (failure) => ErrorDiseaseState(
      message: _mapFailureToMessage(failure),
    ),
    (disease) => LoadedDiseaseState(disease: disease),
  );
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case OfflineFailure:
      return OFFLINE_FAILURE_MESSAGE;
    default:
      return "Unexpected Error , Please try again later .";
  }
}