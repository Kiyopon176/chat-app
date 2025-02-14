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
    apiKey: 'AIzaSyD9PeidWItyvpPQkPj_R4AydbIndheZtLY',
    appId: '1:909245311676:web:5b2fbc655cce21da693eb9',
    messagingSenderId: '909245311676',
    projectId: 'chat-app-b75b5',
    authDomain: 'chat-app-b75b5.firebaseapp.com',
    storageBucket: 'chat-app-b75b5.appspot.com',
    measurementId: 'G-Z7T68D4412',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCbVcmoZ7IXNA-_fyaHHJoZA7HtiZtc2k0',
    appId: '1:909245311676:android:bafc0a9484589b8a693eb9',
    messagingSenderId: '909245311676',
    projectId: 'chat-app-b75b5',
    storageBucket: 'chat-app-b75b5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAN4mcn2ZfRTlyk_nruS9I_ez8nnBsFTRM',
    appId: '1:909245311676:ios:d4390ff11d3aa916693eb9',
    messagingSenderId: '909245311676',
    projectId: 'chat-app-b75b5',
    storageBucket: 'chat-app-b75b5.appspot.com',
    iosBundleId: 'com.example.chatAppTask',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAN4mcn2ZfRTlyk_nruS9I_ez8nnBsFTRM',
    appId: '1:909245311676:ios:d4390ff11d3aa916693eb9',
    messagingSenderId: '909245311676',
    projectId: 'chat-app-b75b5',
    storageBucket: 'chat-app-b75b5.appspot.com',
    iosBundleId: 'com.example.chatAppTask',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD9PeidWItyvpPQkPj_R4AydbIndheZtLY',
    appId: '1:909245311676:web:95cb09c908def475693eb9',
    messagingSenderId: '909245311676',
    projectId: 'chat-app-b75b5',
    authDomain: 'chat-app-b75b5.firebaseapp.com',
    storageBucket: 'chat-app-b75b5.appspot.com',
    measurementId: 'G-4FPC150T8J',
  );

}