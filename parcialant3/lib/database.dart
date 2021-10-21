// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';

class Database {
  late FirebaseFirestore firestore;
  initiliase() {
    firestore = FirebaseFirestore.instance;
  }

  Future<void> create(
      String id, String clientee, String apellido, String obser) async {
    try {
      await firestore.collection("factura").doc(id).collection("cliente").add({
        'cliente': clientee,
        'apellido': apellido,
        'observaciones': obser,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> delete(String id, String id2) async {
    try {
      await firestore
          .collection("factura")
          .doc(id)
          .collection("cliente")
          .doc(id2)
          .delete();
    } catch (e) {
      print(e);
    }
  }

  Future<List> read() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await firestore.collection('factura').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {
            "id": "Factura " + doc.id,
          };
          docs.add(a);
        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
    return read();
  }

  Future<void> update(String id, String id2, String clientee, String apellido,
      String obser) async {
    try {
      await firestore
          .collection("factura")
          .doc(id)
          .collection("cliente")
          .doc(id2)
          .update({
        'cliente': clientee,
        'apellido': apellido,
        'observaciones': obser,
      });
    } catch (e) {
      print(e);
    }
  }
}
