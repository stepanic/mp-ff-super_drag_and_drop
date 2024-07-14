import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDPCjeiAtYUSg5v0q9WnP1_W0WTKsLlUFk",
            authDomain: "mp-ff-super-drag-and-drop.firebaseapp.com",
            projectId: "mp-ff-super-drag-and-drop",
            storageBucket: "mp-ff-super-drag-and-drop.appspot.com",
            messagingSenderId: "253605455663",
            appId: "1:253605455663:web:0467f838dee9b9dccb23da",
            measurementId: "G-2WJMKLLDEB"));
  } else {
    await Firebase.initializeApp();
  }
}
