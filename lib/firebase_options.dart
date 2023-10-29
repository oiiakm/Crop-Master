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
    apiKey: 'AIzaSyDxiu7JJ2EdF7sQ9xDWujBKLrRGUCMFDyc',
    appId: '1:63363405567:web:bc5896bf093bcc545e5eca',
    messagingSenderId: '63363405567',
    projectId: 'crop-master-9dd6a',
    authDomain: 'crop-master-9dd6a.firebaseapp.com',
    storageBucket: 'crop-master-9dd6a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA0q9h0hyYbrSQ0mTyeGahv4ytjV5O8zb8',
    appId: '1:63363405567:android:eb571194b14bd8725e5eca',
    messagingSenderId: '63363405567',
    projectId: 'crop-master-9dd6a',
    storageBucket: 'crop-master-9dd6a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAMPz0gh7zafTiyAhgxiYBU283hc_fZbpA',
    appId: '1:63363405567:ios:8986c3831a94a12d5e5eca',
    messagingSenderId: '63363405567',
    projectId: 'crop-master-9dd6a',
    storageBucket: 'crop-master-9dd6a.appspot.com',
    iosBundleId: 'com.example.cropmaster',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAMPz0gh7zafTiyAhgxiYBU283hc_fZbpA',
    appId: '1:63363405567:ios:5d91165085c060db5e5eca',
    messagingSenderId: '63363405567',
    projectId: 'crop-master-9dd6a',
    storageBucket: 'crop-master-9dd6a.appspot.com',
    iosBundleId: 'com.example.cropmaster.RunnerTests',
  );
}