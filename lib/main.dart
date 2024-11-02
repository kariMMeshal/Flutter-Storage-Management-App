import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_register_flutter/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Firebase.apps.isEmpty) {
    try {
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: " your api key goes here",
          appId: "your app id ",
          messagingSenderId: " ",
          projectId: " ",
        ),
      );
    } catch (e) {
      print("Error initializing Firebase: $e");
    }
  }
  runApp(const App());
}
