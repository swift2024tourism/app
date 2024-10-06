import 'package:app/model/waypoint.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_model.freezed.dart';

@freezed
class GameModel with _$GameModel {
  const factory GameModel({
    required String name,
    required List<Waypoint> waypoints,
    required String id,
  }) = _GameModel;

  static Future<GameModel> fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) async {
    final data = snapshot.data() as Map<String, dynamic>;
    List<Waypoint> waypoints = [];
    List<dynamic> waypointsRef = data['waypoints'];

    for (final waypointRef in waypointsRef) {
      DocumentReference<Map<String, dynamic>> docRef =
          waypointRef as DocumentReference<Map<String, dynamic>>;
      DocumentSnapshot<Map<String, dynamic>> value = await docRef.get();
      waypoints.add(await Waypoint.fromFirestore(value));
    }

    return GameModel(
        name: data['name'] as String, waypoints: waypoints, id: snapshot.id);
  }
}
