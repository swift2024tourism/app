import 'package:app/model/picture/picture_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'waypoint.freezed.dart';

@freezed
class Waypoint with _$Waypoint {
  const factory Waypoint({
    required GeoPoint geopoint,
    required List<PictureModel> pictures,
    required String id,
  }) = _Waypoint;

  static Future<Waypoint> fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) async {
    try {
      final data = snapshot.data() as Map<String, dynamic>;

      List<DocumentReference<Map<String, dynamic>>> picturesRef = List<DocumentReference<Map<String, dynamic>>>.from(data['pictures']);

      List<PictureModel> pictures = await Future.wait(picturesRef.map((DocumentReference<Map<String, dynamic>> e) async {
        return PictureModel.fromFirestore(await e.get());
      }));

      GeoPoint geoPoint = data['geopoint'] as GeoPoint;
      debugPrint("Waypoint fromFirestore: $geoPoint, $pictures");

      return Waypoint(geopoint: geoPoint, pictures: pictures, id: snapshot.id);
    } catch (e) {
      throw Exception("Waypoint fromFirestore error: $e");
    }
  }
}
