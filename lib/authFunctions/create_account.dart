import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:login_register_flutter/Auth_sharedwidgets/custom_dialog.dart';
import 'package:login_register_flutter/pages/login_page.dart';

class CreateAccount {
  CreateAccount._();

  static void createAccount(context,
      {required String emailAddress, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      CustomDialog(
        context: context,
        title: "Verification",
        message:
            'an Verification Email has been sent to your email please verify then login',
        dialogType: DialogType.info,
        btnOkOnPress: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginPage()));
        },
      ).customDialog();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        CustomDialog(
          context: context,
          title: "Erorr",
          message: 'The password provided is too weak.n',
          dialogType: DialogType.error,
        ).customDialog();
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        CustomDialog(
          context: context,
          title: "Erorr",
          message: 'The account already exists for that email.',
          dialogType: DialogType.error,
        ).customDialog();
      }
    } catch (e) {
      print(e);
    }
  }
}
