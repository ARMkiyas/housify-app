import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAYRkcOLJJPbvJQyMu6ZRn7P_O3Tpl7Vpk",
            authDomain: "housify-ujjxfr.firebaseapp.com",
            projectId: "housify-ujjxfr",
            storageBucket: "housify-ujjxfr.appspot.com",
            messagingSenderId: "626917610268",
            appId: "1:626917610268:web:aa8ba5e5d2248a751b20d9"));
  } else {
    await Firebase.initializeApp();
  }
}
