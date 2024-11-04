import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddDataFunc {
  // FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference categories =
      FirebaseFirestore.instance.collection('categories');

  Future<void> addCategory({
    required BuildContext context,
    required String categoryName,
  }) async {
    // Call the user's CollectionReference to add a new user
    try {
      await categories.add(
        {
          'category_name': categoryName,
          "id": FirebaseAuth.instance.currentUser!.uid,
        },
      );
      print("==== Category Added ===");
      Navigator.pushNamedAndRemoveUntil(context, "homePage", (route) => false);
    } catch (e) {
      print("=== Failed to add user: $e =====");
    }
  }
}
