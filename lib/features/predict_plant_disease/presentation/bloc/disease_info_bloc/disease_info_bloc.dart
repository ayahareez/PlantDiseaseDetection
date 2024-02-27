import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/strings/failurs.dart';
import '../../../domain/entities/disease.dart';
import '../../../domain/entities/disease_information.dart';
import '../../../domain/usecases/get_disease_info_usecase.dart';

part 'disease_info_event.dart';
part 'disease_info_state.dart';

class DiseaseInfoBloc extends Bloc<DiseaseInfoEvent, DiseaseInfoState> {
  final GetDiseaseInfoUC getDiseaseInfoUC;
  DiseaseInfoBloc({required this.getDiseaseInfoUC})
      : super(DiseaseInfoInitial()) {
    on<DiseaseInfoEvent>((event, emit) async {
      if (event is GetDiseaseInfo) {
        emit(LoadingDiseaseInfoState());

        final failureOrInfo = await getDiseaseInfoUC(event.disease);
        emit(_mapFailureOrInfoToState(failureOrInfo));
      }
    });
  }

  DiseaseInfoState _mapFailureOrInfoToState(
      Either<Failure, DiseaseInformation> either) {
    return either.fold(
        (failure) =>
            ErrorDiseaseInfoState(message: _mapFailureToMessage(failure)),
        (diseaseInformation) =>
            LoadedDiseaseInfoState(diseaseInformation: diseaseInformation));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case EmptyListFailure:
        return EMPTY_LIST_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}