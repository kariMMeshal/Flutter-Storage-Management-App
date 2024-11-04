import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetdataFunc {
  GetdataFunc._();

  static Future<List<QueryDocumentSnapshot>> getData() async {
    List<QueryDocumentSnapshot> data = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("categories")
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    data.addAll(querySnapshot.docs);
    return data;
  }
}
