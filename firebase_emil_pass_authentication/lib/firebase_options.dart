// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyA3m0EYNs5nMxIH4E-GBoXesZthrhWYltM',
    appId: '1:123815349562:web:d04d1523503ab6d48c5403',
    messagingSenderId: '123815349562',
    projectId: 'email-password-authentic-d02ed',
    authDomain: 'email-password-authentic-d02ed.firebaseapp.com',
    storageBucket: 'email-password-authentic-d02ed.appspot.com',
    measurementId: 'G-F18TJFZM73',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC1jblwxHbBCAOHU9UsQ36yuAWrnyZA7bw',
    appId: '1:123815349562:android:0a4b9f42e0d8afad8c5403',
    messagingSenderId: '123815349562',
    projectId: 'email-password-authentic-d02ed',
    storageBucket: 'email-password-authentic-d02ed.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAxibgxhdIb4tOe3gO_FCALVPn2GDpvYrs',
    appId: '1:123815349562:ios:c2bf74122e5b70ae8c5403',
    messagingSenderId: '123815349562',
    projectId: 'email-password-authentic-d02ed',
    storageBucket: 'email-password-authentic-d02ed.appspot.com',
    iosBundleId: 'com.example.firebaseEmilPassAuthentication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAxibgxhdIb4tOe3gO_FCALVPn2GDpvYrs',
    appId: '1:123815349562:ios:c2bf74122e5b70ae8c5403',
    messagingSenderId: '123815349562',
    projectId: 'email-password-authentic-d02ed',
    storageBucket: 'email-password-authentic-d02ed.appspot.com',
    iosBundleId: 'com.example.firebaseEmilPassAuthentication',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA3m0EYNs5nMxIH4E-GBoXesZthrhWYltM',
    appId: '1:123815349562:web:e9b246aeb5e691a68c5403',
    messagingSenderId: '123815349562',
    projectId: 'email-password-authentic-d02ed',
    authDomain: 'email-password-authentic-d02ed.firebaseapp.com',
    storageBucket: 'email-password-authentic-d02ed.appspot.com',
    measurementId: 'G-CNE2ELWMWB',
  );
}
