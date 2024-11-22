import 'package:app/model/waypoint/waypoint.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_cache/firestore_cache.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_model.freezed.dart';

@freezed
class GameModel with _$GameModel {
  const factory GameModel({
    required String name,
    required List<Waypoint> waypoints,
    required String id,
  }) = _GameModel;

  static Future<GameModel> fromFirestore(QueryDocumentSnapshot<Map<String, dynamic>> snapshot) async {
    try {
      final data = snapshot.data() as Map<String, dynamic>;
      List<Waypoint> waypoints = [];
      List<dynamic> waypointsRef = data['waypoints'];

      for (final waypointRef in waypointsRef) {
        DocumentReference<Map<String, dynamic>> docRef = waypointRef as DocumentReference<Map<String, dynamic>>;
        final cached = await FirestoreCache.getDocument(docRef);
        waypoints.add(await Waypoint.fromFirestore(cached));
      }
      String name = data['name'] as String;
      debugPrint("GameModel fromFirestore: $name");

      return GameModel(name: name, waypoints: waypoints, id: snapshot.id);
    } catch (e) {
      throw Exception("GameModel fromFirestore error: $e");
    }
  }
}
