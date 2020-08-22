import 'package:cloud_firestore/cloud_firestore.dart';

class CrudMethods {
  Future<void> addData(postdata) async {
    Firestore.instance.collection("posts").add(postdata).catchError((e) {
      print(e);
    });
  }

  getData() async {
    return await Firestore.instance
        .collection("posts")
        .orderBy("time", descending: true)
        .getDocuments();
  }
}
