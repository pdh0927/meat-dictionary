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
    apiKey: 'AIzaSyAl7i4vfqJ39wf7r1kXijXHQeq2sKm2-Ok',
    appId: '1:899805645179:web:763732552b12e7d41d15de',
    messagingSenderId: '899805645179',
    projectId: 'meat-dictionary',
    authDomain: 'meat-dictionary.firebaseapp.com',
    storageBucket: 'meat-dictionary.appspot.com',
    measurementId: 'G-5QHE81QW6J',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDEN6SjbT6bbrqi7QpDjM57ut6WxIvtHEc',
    appId: '1:899805645179:android:d85932035bfccf291d15de',
    messagingSenderId: '899805645179',
    projectId: 'meat-dictionary',
    storageBucket: 'meat-dictionary.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCXLswIyi7XtjT_G6kvsJeqoggJky5M43A',
    appId: '1:899805645179:ios:0c3f88519d61569d1d15de',
    messagingSenderId: '899805645179',
    projectId: 'meat-dictionary',
    storageBucket: 'meat-dictionary.appspot.com',
    iosBundleId: 'com.dh.meatdictionary',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCXLswIyi7XtjT_G6kvsJeqoggJky5M43A',
    appId: '1:899805645179:ios:4b7a4ff359079e811d15de',
    messagingSenderId: '899805645179',
    projectId: 'meat-dictionary',
    storageBucket: 'meat-dictionary.appspot.com',
    iosBundleId: 'com.example.meatDictionary',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAl7i4vfqJ39wf7r1kXijXHQeq2sKm2-Ok',
    appId: '1:899805645179:web:a2c269585a94ed1e1d15de',
    messagingSenderId: '899805645179',
    projectId: 'meat-dictionary',
    authDomain: 'meat-dictionary.firebaseapp.com',
    storageBucket: 'meat-dictionary.appspot.com',
    measurementId: 'G-40L0Z1RH7R',
  );
}
