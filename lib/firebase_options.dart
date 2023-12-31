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
    apiKey: 'AIzaSyAPorkB-EvuUUctd4bqqgWa_ATzh1Fk4ws',
    appId: '1:948314579919:web:aa790b1a894f5d44a328ba',
    messagingSenderId: '948314579919',
    projectId: 'fir-auth-rsfg',
    authDomain: 'fir-auth-rsfg.firebaseapp.com',
    storageBucket: 'fir-auth-rsfg.appspot.com',
    measurementId: 'G-LMGHMFG272',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD6-3GJrPBe8e3rrGCpQJhzfBi4wKwuqFM',
    appId: '1:948314579919:android:829886e57a438ecda328ba',
    messagingSenderId: '948314579919',
    projectId: 'fir-auth-rsfg',
    storageBucket: 'fir-auth-rsfg.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCeKVrK8nKtFQKAjKLYeaUCzd-f8ymWIBE',
    appId: '1:948314579919:ios:283578c2dd379ab4a328ba',
    messagingSenderId: '948314579919',
    projectId: 'fir-auth-rsfg',
    storageBucket: 'fir-auth-rsfg.appspot.com',
    iosBundleId: 'com.example.flutterFirebaseRsfg',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCeKVrK8nKtFQKAjKLYeaUCzd-f8ymWIBE',
    appId: '1:948314579919:ios:fa5404786a800923a328ba',
    messagingSenderId: '948314579919',
    projectId: 'fir-auth-rsfg',
    storageBucket: 'fir-auth-rsfg.appspot.com',
    iosBundleId: 'com.example.flutterFirebaseRsfg.RunnerTests',
  );
}
