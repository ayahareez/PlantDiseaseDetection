import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:plant_disease/features/predict_plant_disease/data/repositories/disease_repository_impl.dart';
import 'package:plant_disease/features/predict_plant_disease/domain/use_cases/add_photo_usecase.dart';
import 'package:plant_disease/features/predict_plant_disease/presentation/bloc/disease_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/networks/network_info.dart';
import 'features/predict_plant_disease/data/data_sources/disease_remote_ds.dart';
import 'features/predict_plant_disease/domain/repositories/disease_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
//! Features - posts

// Bloc

  sl.registerFactory(() => DiseaseBloc(addPhotoUC: sl()));

// Usecases

  sl.registerLazySingleton(() => AddPhotoUC(diseaseRepository: sl()));

// Repository

  sl.registerLazySingleton<DiseaseRepository>(
      () => DiseaseRepositoryImpl(networkInfo: sl(), diseaseRemoteDs: sl()));

// Datasources

  sl.registerLazySingleton<DiseaseRemoteDs>(
      () => DiseaseRemoteDsImpl(client: sl()));

//! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectionChecker: sl()));

//! External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
