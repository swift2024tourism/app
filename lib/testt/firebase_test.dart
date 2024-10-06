import 'package:app/model/game_model.dart';
import 'package:app/model/picture_model.dart';
import 'package:app/repository/games_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> testFirebase() async {
  var ref = FirebaseFirestore.instance.collection("games");

  await ref.get().then((QuerySnapshot<Object?> snapshot) async {
    for (final docSnapShot in snapshot.docs) {
      debugPrint(docSnapShot["name"]);
      List<dynamic> waypoints = docSnapShot["waypoints"];
      debugPrint("げーむのドックidは${docSnapShot.id}");

      // ignore: avoid_function_literals_in_foreach_calls
      waypoints.forEach((element) async {
        debugPrint(element.toString());
        DocumentReference<Map<String, dynamic>> docRef =
            element as DocumentReference<Map<String, dynamic>>;
        docRef.get().then((DocumentSnapshot<Map<String, dynamic>> value) {
          GeoPoint geo = value["geopoint"] as GeoPoint;
          debugPrint(geo.latitude.toString());
          List<dynamic> pictures = value["pictures"];
          for (var value in pictures) {
            DocumentReference<Map<String, dynamic>> pictureRef =
                value as DocumentReference<Map<String, dynamic>>;
            pictureRef
                .get()
                .then((DocumentSnapshot<Map<String, dynamic>> value) {
              PictureModel model = PictureModel.fromFirestore(value);
              debugPrint(model.name);
            });
          }
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

  for (var game in games) {
    debugPrint(game.name);
    debugPrint(game.id);
    for (var waypoint in game.waypoints) {
      debugPrint(waypoint.geopoint.latitude.toString());
      for (var picture in waypoint.pictures) {
        debugPrint(picture.name);
        debugPrint(picture.id);
      }
    }
  }
}

class FirebaseTestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer(
      builder: (context, ref, _) {
        final games = ref.watch(gamesRepositoryProvider);
        return FutureBuilder(
            future: games.getAllGames(),
            builder: (context, AsyncSnapshot<List<GameModel>> gamesSnapshot) {
              if (gamesSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (gamesSnapshot.hasError) {
                return const Center(child: Text("エラーが発生しました"));
              }
              return ListView.builder(
                  itemCount: gamesSnapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Text(
                            "ゲームの場所：${gamesSnapshot.data![index].name}, id: ${gamesSnapshot.data![index].id}"),
                        subtitle: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount:
                              gamesSnapshot.data![index].waypoints.length,
                          itemBuilder: (context, waypointIndex) {
                            return ListTile(
                              title: Text(
                                  "ウェイポイントの場所：${gamesSnapshot.data![index].waypoints[waypointIndex].geopoint.latitude}"),
                            );
                          },
                        ));
                  });
            });
      },
    ));
  }
}
