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
    apiKey: 'AIzaSyCDZlG4RKrkg2VKAr88wGyxwsXtoy80xVM',
    appId: '1:18628523538:web:390a028a8719bc703c4acb',
    messagingSenderId: '18628523538',
    projectId: 'classroomclone-fb1f7',
    authDomain: 'classroomclone-fb1f7.firebaseapp.com',
    storageBucket: 'classroomclone-fb1f7.appspot.com',
    measurementId: 'G-WX8F844V4Z',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCTXvFZAkgQyingg3T16JHgqxaGVRjET2s',
    appId: '1:18628523538:android:eb5447a35b38a13c3c4acb',
    messagingSenderId: '18628523538',
    projectId: 'classroomclone-fb1f7',
    storageBucket: 'classroomclone-fb1f7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC82GAMJxFMoOW6U6FimMnngcsiiX_EU8g',
    appId: '1:18628523538:ios:53093c7b89baacf33c4acb',
    messagingSenderId: '18628523538',
    projectId: 'classroomclone-fb1f7',
    storageBucket: 'classroomclone-fb1f7.appspot.com',
    iosBundleId: 'com.example.task5GoogleClassroomClone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC82GAMJxFMoOW6U6FimMnngcsiiX_EU8g',
    appId: '1:18628523538:ios:53093c7b89baacf33c4acb',
    messagingSenderId: '18628523538',
    projectId: 'classroomclone-fb1f7',
    storageBucket: 'classroomclone-fb1f7.appspot.com',
    iosBundleId: 'com.example.task5GoogleClassroomClone',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCDZlG4RKrkg2VKAr88wGyxwsXtoy80xVM',
    appId: '1:18628523538:web:5502bcb06e225e963c4acb',
    messagingSenderId: '18628523538',
    projectId: 'classroomclone-fb1f7',
    authDomain: 'classroomclone-fb1f7.firebaseapp.com',
    storageBucket: 'classroomclone-fb1f7.appspot.com',
    measurementId: 'G-T3W9XJYR5Y',
  );
}
