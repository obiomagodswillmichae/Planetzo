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
    apiKey: 'AIzaSyCTxTlw9nLAZhdrDUZmXjsIawFC4SfERQc',
    appId: '1:233347013566:web:354b100f64405cc90b77ef',
    messagingSenderId: '233347013566',
    projectId: 'plantezo',
    authDomain: 'plantezo.firebaseapp.com',
    databaseURL: 'https://plantezo-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'plantezo.appspot.com',
    measurementId: 'G-11CP89WW6E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCPR-L52viL7RkZMlf9VtdRdPsG0egchF8',
    appId: '1:233347013566:android:47a88697d1f2f89d0b77ef',
    messagingSenderId: '233347013566',
    projectId: 'plantezo',
    databaseURL: 'https://plantezo-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'plantezo.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAEMBy_ibzutXONxm9hOyMN7sOBFP1mdK8',
    appId: '1:233347013566:ios:1d0cdbd52febecc20b77ef',
    messagingSenderId: '233347013566',
    projectId: 'plantezo',
    databaseURL: 'https://plantezo-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'plantezo.appspot.com',
    androidClientId: '233347013566-skeu1pa5dv14ah7i69ovi46ahrearn83.apps.googleusercontent.com',
    iosClientId: '233347013566-j7n9s7tfidrdmeppf0hov0mt9riufafc.apps.googleusercontent.com',
    iosBundleId: 'com.example.planetb',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAEMBy_ibzutXONxm9hOyMN7sOBFP1mdK8',
    appId: '1:233347013566:ios:1d0cdbd52febecc20b77ef',
    messagingSenderId: '233347013566',
    projectId: 'plantezo',
    databaseURL: 'https://plantezo-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'plantezo.appspot.com',
    androidClientId: '233347013566-skeu1pa5dv14ah7i69ovi46ahrearn83.apps.googleusercontent.com',
    iosClientId: '233347013566-j7n9s7tfidrdmeppf0hov0mt9riufafc.apps.googleusercontent.com',
    iosBundleId: 'com.example.planetb',
  );
}