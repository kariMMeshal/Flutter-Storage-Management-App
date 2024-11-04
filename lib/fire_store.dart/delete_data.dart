import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DeleteData {
  DeleteData._();

  static Future<void> deleteData(
      {required BuildContext context, required String id}) async {
    await FirebaseFirestore.instance.collection("categories").doc(id).delete();
    Navigator.pushReplacementNamed(context, "homePage");
  }
}
