import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateData {
  CollectionReference categories =
      FirebaseFirestore.instance.collection("categories");
  Future<void> updateCategory(
      {required BuildContext context,
      required String id,
      required String newName}) async {
    try {
      await categories.doc(id).update({"category_name": newName});
      Navigator.pushNamedAndRemoveUntil(
        context,
        "homePage",
        (route) => false,
      );
    } catch (e) {
      print("error $e");
    }
  }
}
