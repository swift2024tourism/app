import 'dart:convert';

import 'package:app/model/picture_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> testFirebase() async {
  var ref = FirebaseFirestore.instance.collection("games");

  await ref.get().then((QuerySnapshot<Object?> snapshot) async {
    for (final docSnapShot in snapshot.docs) {
      debugPrint(docSnapShot["name"]);
      List<dynamic> waypoints = docSnapShot["waypoints"];

      waypoints.forEach((element) async {
        debugPrint(element.toString());
        DocumentReference<Map<String, dynamic>> docRef =
            element as DocumentReference<Map<String, dynamic>>;
        docRef.get().then((DocumentSnapshot<Map<String, dynamic>> value) {
          GeoPoint geo = value["geopoint"] as GeoPoint;
          debugPrint(geo.latitude.toString());
          List<dynamic> pictures = value["pictures"];
          pictures.forEach((value) {
            DocumentReference<Map<String, dynamic>> pictureRef =
                value as DocumentReference<Map<String, dynamic>>;
            pictureRef
                .get()
                .then((DocumentSnapshot<Map<String, dynamic>> value) {
              PictureModel model = PictureModel.fromFirestore(value);
              debugPrint(model.name);
            });
          });
        });
        //GeoPoint geo = (docSnapShot["geopoint"] as GeoPoint);
        //debugPrint(geo.latitude.toString());
        //debugPrint("waypoints");
        //List<dynamic> pictures = element["pictures"];
        //pictures.forEach((value) {
        //  debugPrint("aiueo");
        //  debugPrint(value);
        //  //PictureModel model = PictureModel.fromFirestore(value);
        //  //debugPrint(model.name);
        //});

        //await element.get().then((DocumentSnapshot value) {
        //  debugPrint("aiueo");
        //  PictureModel model = PictureModel.fromFirestore(value);
        //  debugPrint(model.name);
        //});
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
