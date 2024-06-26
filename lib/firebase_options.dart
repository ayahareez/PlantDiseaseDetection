// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBzoxVtBusA8RksE6ZgOzrK-iTjpPAo8mc',
    appId: '1:260302570435:web:4492df2fb78ca0edb5f376',
    messagingSenderId: '260302570435',
    projectId: 'plant-disease-7d41a',
    authDomain: 'plant-disease-7d41a.firebaseapp.com',
    storageBucket: 'plant-disease-7d41a.appspot.com',
    measurementId: 'G-Z3H04DMT2X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDWXzdbyls-gDScU_SQ5T-vnb9UCPTiZXE',
    appId: '1:260302570435:android:44cb19c8768a5810b5f376',
    messagingSenderId: '260302570435',
    projectId: 'plant-disease-7d41a',
    storageBucket: 'plant-disease-7d41a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCMdzBB1_jGNoHAaGzONhZQMP-FU2Ww1cs',
    appId: '1:260302570435:ios:d0c026c9c29e1447b5f376',
    messagingSenderId: '260302570435',
    projectId: 'plant-disease-7d41a',
    storageBucket: 'plant-disease-7d41a.appspot.com',
    iosBundleId: 'com.example.plantDisease',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCMdzBB1_jGNoHAaGzONhZQMP-FU2Ww1cs',
    appId: '1:260302570435:ios:a72c4a5fc34fc060b5f376',
    messagingSenderId: '260302570435',
    projectId: 'plant-disease-7d41a',
    storageBucket: 'plant-disease-7d41a.appspot.com',
    iosBundleId: 'com.example.plantDisease.RunnerTests',
  );
}
