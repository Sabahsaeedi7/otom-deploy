import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyClSg6pvyEewTdJcUIixr_zKZmXbt66ujA",
            authDomain: "otombelakam-cb8ef.firebaseapp.com",
            projectId: "otombelakam-cb8ef",
            storageBucket: "otombelakam-cb8ef.appspot.com",
            messagingSenderId: "788489929186",
            appId: "1:788489929186:web:a149b573161f4d87f679bb",
            measurementId: "G-KEBG6JM54S"));
  } else {
    await Firebase.initializeApp();
  }
}
