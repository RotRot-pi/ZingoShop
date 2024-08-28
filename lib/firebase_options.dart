import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyAWmuF6rksg_kH9u8S3-p_AUG7xFZ97enM',
    appId: '1:687641064898:web:8c2354104283e7c769d25b',
    messagingSenderId: '687641064898',
    projectId: 'e-commerce-e529b',
    authDomain: 'e-commerce-e529b.firebaseapp.com',
    storageBucket: 'e-commerce-e529b.appspot.com',
    measurementId: 'G-ZZ65YNL33D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDJq64Jctm3voWDk_tR0VDWIbOfN_8C6g8',
    appId: '1:687641064898:android:06c4ff48b68cea2c69d25b',
    messagingSenderId: '687641064898',
    projectId: 'e-commerce-e529b',
    storageBucket: 'e-commerce-e529b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAPvpL8a0GWlgJWxAnQmEEigKU_P-eUrrY',
    appId: '1:687641064898:ios:b345bfe934fafebf69d25b',
    messagingSenderId: '687641064898',
    projectId: 'e-commerce-e529b',
    storageBucket: 'e-commerce-e529b.appspot.com',
    iosBundleId: 'com.waelabohamza.ecommercecourse',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAPvpL8a0GWlgJWxAnQmEEigKU_P-eUrrY',
    appId: '1:687641064898:ios:b63d92148b710d7369d25b',
    messagingSenderId: '687641064898',
    projectId: 'e-commerce-e529b',
    storageBucket: 'e-commerce-e529b.appspot.com',
    iosBundleId: 'com.example.ecommercecourse.RunnerTests',
  );
}
