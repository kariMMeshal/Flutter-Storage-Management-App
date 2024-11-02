import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_register_flutter/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Firebase.apps.isEmpty) {
    try {
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "AIzaSyAkNhbaX3qjfWAhmja49ejAfbp59Oz1b3M",
          appId: "1:332720236677:android:8d3a2598c32c6c53bfa1ec",
          messagingSenderId: "332720236677",
          projectId: "shop-18342",
        ),
      );
    } catch (e) {
      print("Error initializing Firebase: $e");
    }
  }
  runApp(const App());
}
