import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyB8V3s2wW61pOICplQfSsxDXRVvwZ9_cK8",
            authDomain: "code-de-la-route-c41d0.firebaseapp.com",
            projectId: "code-de-la-route-c41d0",
            storageBucket: "code-de-la-route-c41d0.appspot.com",
            messagingSenderId: "483754442098",
            appId: "1:483754442098:web:abedebaa82654b0a4171eb",
            measurementId: "G-JS7PCND8MS"));
  } else {
    await Firebase.initializeApp();
  }
}
