import 'package:app/model/picture_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'waypoint.freezed.dart';

@freezed
class Waypoint with _$Waypoint {
  const factory Waypoint({
    required GeoPoint geopoint,
    required List<PictureModel> pictures,
  }) = _Waypoint;

  static Future<Waypoint> fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) async {
    final data = snapshot.data() as Map<String, dynamic>;

    List<DocumentReference<Map<String, dynamic>>> picturesRef =
        List<DocumentReference<Map<String, dynamic>>>.from(data['pictures']);

    List<PictureModel> pictures = await Future.wait(
        picturesRef.map((DocumentReference<Map<String, dynamic>> e) async {
      return await PictureModel.fromFirestore(await e.get());
    }));

    return Waypoint(geopoint: data['geopoint'] as GeoPoint, pictures: pictures);
  }
}
