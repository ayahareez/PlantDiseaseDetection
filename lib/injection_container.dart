import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:plant_disease/features/predict_plant_disease/data/repositories/disease_info_repository_impl.dart';
import 'package:plant_disease/features/predict_plant_disease/data/repositories/disease_repository_impl.dart';
import 'package:plant_disease/features/predict_plant_disease/presentation/bloc/disease_bloc/disease_bloc.dart';
import 'package:plant_disease/features/predict_plant_disease/presentation/bloc/disease_info_bloc/disease_info_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/networks/network_info.dart';
import 'features/predict_plant_disease/data/data_sources/remote_ds/disease_remote_ds.dart';
import 'features/predict_plant_disease/domain/repositories/disease_info_repository.dart';
import 'features/predict_plant_disease/domain/repositories/disease_repository.dart';
import 'features/predict_plant_disease/domain/usecases/add_photo_usecase.dart';
import 'features/predict_plant_disease/domain/usecases/get_disease_info_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
//! Features - posts

// Bloc

  sl.registerFactory(() => DiseaseBloc(addPhotoUC: sl()));
  sl.registerFactory(() => DiseaseInfoBloc(getDiseaseInfoUC: sl()));

// Usecases

  sl.registerLazySingleton(() => AddPhotoUC(diseaseRepository: sl()));
  sl.registerLazySingleton(() => GetDiseaseInfoUC(diseaseInfoRepository: sl()));

// Repository

  sl.registerLazySingleton<DiseaseRepository>(
      () => DiseaseRepositoryImpl(networkInfo: sl(), diseaseRemoteDs: sl()));
  sl.registerLazySingleton<DiseaseInfoRepository>(
      () => DiseaseInfoRepositoryImpl());

// Datasources

  sl.registerLazySingleton<DiseaseRemoteDs>(
      () => DiseaseRemoteDsImpl(client: sl()));

//! Core

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));

//! External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}