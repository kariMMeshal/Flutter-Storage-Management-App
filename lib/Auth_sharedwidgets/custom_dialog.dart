import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class CustomDialog {
  BuildContext context;
  String message;
  String title;
  DialogType dialogType;
  void Function()? btnOkOnPress;
  void Function()? btnCancelOnPress;

  CustomDialog({
    required this.context,
    required this.message,
    required this.title,
    required this.dialogType,
    this.btnOkOnPress,
    this.btnCancelOnPress,
  });

  customDialog() {
    return AwesomeDialog(
      context: context,
      dialogType: dialogType,
      animType: AnimType.bottomSlide,
      title: title,
      desc: message,
      btnCancelOnPress: btnCancelOnPress,
      btnOkOnPress: btnOkOnPress,
    ).show();
  }
}
