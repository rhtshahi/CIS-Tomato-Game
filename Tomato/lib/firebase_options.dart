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
    apiKey: 'AIzaSyAE97Hpaqr8mqtOLZF6VKdUjknXDCY5rJc',
    appId: '1:494682660331:web:9008d701287a89bdbb8dae',
    messagingSenderId: '494682660331',
    projectId: 'cis-tomato-game',
    authDomain: 'cis-tomato-game.firebaseapp.com',
    storageBucket: 'cis-tomato-game.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDbShSL19W7gGky-i7ZzOv30VpzZolq5UU',
    appId: '1:494682660331:android:4f202abe7a382244bb8dae',
    messagingSenderId: '494682660331',
    projectId: 'cis-tomato-game',
    storageBucket: 'cis-tomato-game.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAurRf5TfLlYOVzHFOcT74wwB7Wqr1zZeo',
    appId: '1:494682660331:ios:05fd8db4e7a701e8bb8dae',
    messagingSenderId: '494682660331',
    projectId: 'cis-tomato-game',
    storageBucket: 'cis-tomato-game.appspot.com',
    iosBundleId: 'com.cis.tomato.cisTomatoGame',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAurRf5TfLlYOVzHFOcT74wwB7Wqr1zZeo',
    appId: '1:494682660331:ios:64889cb56c03f168bb8dae',
    messagingSenderId: '494682660331',
    projectId: 'cis-tomato-game',
    storageBucket: 'cis-tomato-game.appspot.com',
    iosBundleId: 'com.cis.tomato.cisTomatoGame.RunnerTests',
  );
}
