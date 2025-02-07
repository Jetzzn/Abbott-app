import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyC5G5jICwXH7PPuOxwTD-DXUZ3UnxMjZ64",
            authDomain: "abbot-e2d4c.firebaseapp.com",
            projectId: "abbot-e2d4c",
            storageBucket: "abbot-e2d4c.firebasestorage.app",
            messagingSenderId: "262076126066",
            appId: "1:262076126066:web:f7cfe573a00eca064f83eb",
            measurementId: "G-TWEP15F5Y9"));
  } else {
    await Firebase.initializeApp();
  }
}
