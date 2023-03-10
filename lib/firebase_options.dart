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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDaG-QNjwBANvOuU5VnUeqzIOAP2Fcs4xY',
    appId: '1:533234919392:web:f999c39cd44a7f4ea7ad85',
    messagingSenderId: '533234919392',
    projectId: 'report-f28dd',
    authDomain: 'report-f28dd.firebaseapp.com',
    databaseURL:
        'https://report-f28dd-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'report-f28dd.appspot.com',
    measurementId: 'G-TFPW44E5HD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDJCjYnglEXiralmzmvddC5815dE6U5cxg',
    appId: '1:533234919392:android:6e4eef5b738fd3d6a7ad85',
    messagingSenderId: '533234919392',
    projectId: 'report-f28dd',
    databaseURL:
        'https://report-f28dd-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'report-f28dd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBDTVxz_c8-Dqpkyp6hlZ0__GBTkqvbFas',
    appId: '1:533234919392:ios:44484d7585209676a7ad85',
    messagingSenderId: '533234919392',
    projectId: 'report-f28dd',
    databaseURL:
        'https://report-f28dd-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'report-f28dd.appspot.com',
    iosClientId:
        '533234919392-9ugkdrovhlulm69ajculfvi00q1dlhid.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1',
  );
}
