import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:plant_disease/core/networks/network_info.dart';
import 'package:plant_disease/features/predict_plant_disease/data/data_sources/disease_remote_ds.dart';
import 'package:plant_disease/features/predict_plant_disease/data/repositories/disease_repository_impl.dart';
import 'package:plant_disease/features/predict_plant_disease/domain/repositories/disease_repository.dart';
import 'package:plant_disease/features/predict_plant_disease/domain/usecases/add_photo_usecase.dart';
import 'package:plant_disease/features/predict_plant_disease/presentation/bloc/disease_bloc.dart';
import 'core/db_helper.dart';
import 'features/auth/data/datasorce/authentication_remote_ds/authentication.dart';
import 'features/auth/data/datasorce/user_remote_ds/user_remote_ds.dart';
import 'features/auth/presentation/bloc/auth_bloc/authentication_bloc.dart';
import 'features/auth/presentation/bloc/user_data_bloc/user_data_bloc.dart';
import 'features/auth/presentation/pages/splash_page.dart';
import 'package:http/http.dart' as http;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  print(Firebase.apps.first);
  // await AuthenticationImp().signOut();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
            create: (context) => AuthenticationBloc(AuthenticationImp(),
                UserDBModelImp(dbHelper: RemoteDBHelperImp()))),
        BlocProvider<UserDataBloc>(
            create: (context) =>
                UserDataBloc(UserDBModelImp(dbHelper: RemoteDBHelperImp()))),
        BlocProvider(
            create: (context) => DiseaseBloc(
                    addPhotoUC: AddPhotoUC(
                        diseaseRepository: DiseaseRepositoryImpl(
                  networkInfo: NetworkInfoImpl(
                      connectionChecker: InternetConnectionChecker()),
                  diseaseRemoteDs: DiseaseRemoteDsImpl(client: http.Client()),
                ))))
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen());
  }
}