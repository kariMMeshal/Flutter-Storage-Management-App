import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:login_register_flutter/pages/login_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignOut {
  SignOut._();

  static void logOut(context) async {
    GoogleSignIn? googleSignIn = GoogleSignIn();
    googleSignIn!.disconnect();
    FacebookAuth.instance!.logOut();
    await FirebaseAuth.instance!.signOut();

    print("======= You are Signed Out  ========");
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }
}
