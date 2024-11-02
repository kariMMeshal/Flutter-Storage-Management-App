import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_register_flutter/authFunctions/facebook_login.dart';

class CheckState {
  CheckState._();

  static void getState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('===== User is currently signed out! =====');
      } else {
        print('===== User is signed in! ======');
      }
    });
  }

  static Future<bool> isUserSignedIn() async {
    User? user = FirebaseAuth.instance.currentUser;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    bool isSignedInGoogle = await googleSignIn.isSignedIn() ?? false;
    final accessToken = await FacebookAuth.instance.accessToken;
    bool? isSignedInFacebook = accessToken != null;

    if (isSignedInGoogle || isSignedInFacebook) {
      print(isSignedInGoogle? "==== Google ====" : "==== FaceBook =====");
      return true;
    } else if (user != null) {
      // Check if the user's email is verified
      print("Ver ==> ${user.emailVerified}");
      return user.emailVerified;
    }

    return false; // google signing
  }
}

// class CheckState {
//   static Future<bool> isUserSignedIn() async {
//     User? user = FirebaseAuth.instance.currentUser;

//     // Check if the user is signed in
//     if (user != null) {
//       // Check if the user's email is verified
//       return user.emailVerified;
//     }
//     return false; // Not signed in
//   }
// }
