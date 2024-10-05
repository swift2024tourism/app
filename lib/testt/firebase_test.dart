import 'package:app/model/game_model.dart';
import 'package:app/model/picture_model.dart';
import 'package:app/model/waypoint.dart';
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
      });
    }
  });
}

Future<void> testFirebase2() async {
  List<GameModel> games = [];
  games = await FirebaseFirestore.instance
      .collection("games")
      .get()
      .then((QuerySnapshot<Object?> snapshot) async {
    return games = await Future.wait(snapshot.docs
        .map((QueryDocumentSnapshot<Object?> documentSnapshot) async {
      return await GameModel.fromFirestore(
          documentSnapshot as DocumentSnapshot<Map<String, dynamic>>);
    }));
  });

  games.forEach(
    (GameModel game) {
      debugPrint(game.name);
      game.waypoints.forEach((Waypoint waypoint) {
        debugPrint(waypoint.geopoint.latitude.toString());
        waypoint.pictures.forEach((PictureModel picture) {
          debugPrint(picture.name);
        });
      });
    },
  );
}
