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
    apiKey: 'AIzaSyDm40yHIJiPRNEqeq_2qrgivXo87kqRNQI',
    appId: '1:239537993579:web:0b34d6b7affd057cd27e2e',
    messagingSenderId: '239537993579',
    projectId: 'pizza-delivery-2bf74',
    authDomain: 'pizza-delivery-2bf74.firebaseapp.com',
    storageBucket: 'pizza-delivery-2bf74.firebasestorage.app',
    measurementId: 'G-2YY1LELS0C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBMyujNWtaKH-GskbCS2l1I_XS9T1dThEQ',
    appId: '1:239537993579:android:9db5130db695ca87d27e2e',
    messagingSenderId: '239537993579',
    projectId: 'pizza-delivery-2bf74',
    storageBucket: 'pizza-delivery-2bf74.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCW09Pngj_5hDxsP1KpBR5XDsLwerESFQg',
    appId: '1:239537993579:ios:eaa93b12851355fbd27e2e',
    messagingSenderId: '239537993579',
    projectId: 'pizza-delivery-2bf74',
    storageBucket: 'pizza-delivery-2bf74.firebasestorage.app',
    iosBundleId: 'com.zlanca.pizzaDelivery',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCW09Pngj_5hDxsP1KpBR5XDsLwerESFQg',
    appId: '1:239537993579:ios:eaa93b12851355fbd27e2e',
    messagingSenderId: '239537993579',
    projectId: 'pizza-delivery-2bf74',
    storageBucket: 'pizza-delivery-2bf74.firebasestorage.app',
    iosBundleId: 'com.zlanca.pizzaDelivery',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDm40yHIJiPRNEqeq_2qrgivXo87kqRNQI',
    appId: '1:239537993579:web:8280d4ca4ecde3fbd27e2e',
    messagingSenderId: '239537993579',
    projectId: 'pizza-delivery-2bf74',
    authDomain: 'pizza-delivery-2bf74.firebaseapp.com',
    storageBucket: 'pizza-delivery-2bf74.firebasestorage.app',
    measurementId: 'G-9WC82876M5',
  );
}
