import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookLogin {
  FacebookLogin._();

  // static Future<UserCredential> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();

  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

  //   // Once signed in, return the UserCredential
  //   print("===Successfull===");
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }

  static Future<void> signInWithFacebook(BuildContext context) async {
    try {
      // Trigger the Facebook sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Check if login was successful
      if (loginResult.status == LoginStatus.success) {
        // Retrieve the access token
        final AccessToken? accessToken = loginResult.accessToken;

        // Ensure the access token is not null and get the actual token string
        if (accessToken != null) {
          final OAuthCredential facebookAuthCredential =
              FacebookAuthProvider.credential(accessToken.tokenString);
          UserCredential userCredential = await FirebaseAuth.instance
              .signInWithCredential(facebookAuthCredential);

          // Once signed in, return the UserCredential
          await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
          Navigator.pushNamed(context, "homePage");
        }
      } else {
        print("Facebook login failed: ${loginResult.message}");
      }
    } catch (e) {
      print("Error during Facebook login: $e");
    }
  }
}
