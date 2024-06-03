import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_disease/features/predict_plant_disease/data/models/plant_model.dart';
import 'package:plant_disease/features/predict_plant_disease/presentation/bloc/disease_bloc/disease_bloc.dart';
import 'package:plant_disease/features/predict_plant_disease/presentation/bloc/disease_info_bloc/disease_info_bloc.dart';
import 'package:plant_disease/features/predict_plant_disease/presentation/pages/predicted_Result_page.dart';
import 'core/app_theme.dart';
import 'core/db_helper.dart';
import 'features/auth/data/datasorce/authentication_remote_ds/authentication.dart';
import 'features/auth/data/datasorce/user_remote_ds/user_remote_ds.dart';
import 'features/auth/presentation/bloc/auth_bloc/authentication_bloc.dart';
import 'features/auth/presentation/bloc/user_data_bloc/user_data_bloc.dart';
import 'features/auth/presentation/pages/splash_page.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate();
  await di.init();
  print(Firebase.apps.first);
  //await AuthenticationImp().signOut();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/lang', // <-- change the path of the translation files
      fallbackLocale: Locale('en'),
      startLocale: Locale('ar'),
      child: MultiBlocProvider(providers: [
        BlocProvider<AuthenticationBloc>(
            create: (context) => AuthenticationBloc(AuthenticationImp(),
                UserDBModelImp(dbHelper: RemoteDBHelperImp()))),
        BlocProvider<UserDataBloc>(
            create: (context) =>
                UserDataBloc(UserDBModelImp(dbHelper: RemoteDBHelperImp()))),
        BlocProvider(create: (_) => di.sl<DiseaseBloc>()),
        BlocProvider(create: (context) => di.sl<DiseaseInfoBloc>()),
      ], child: const MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Flutter Demo',
        theme: appTheme,
        home: const SplashScreen());
  }
}