import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> testFirebase() async {
  var ref = FirebaseFirestore.instance.collection("games");

  await ref.get().then((QuerySnapshot<Object?> snapshot) async {
    for (final docSnapShot in snapshot.docs) {
      debugPrint(docSnapShot["name"]);
      List<dynamic> list = docSnapShot["waypoints"];
      list.forEach((element) async {
        await element.get().then((DocumentSnapshot value) {
          debugPrint(value["name"]);
          debugPrint(((value["geopoint"]) as GeoPoint).latitude.toString());
        });
      });
//      for (DocumentReference<Map<String, dynamic>> element in list) {
//        await element
//            .get()
//            .then((DocumentSnapshot<Map<String, dynamic>> value) {
//          debugPrint(value["name"]);
//        });
//      }
    }
  });
}
