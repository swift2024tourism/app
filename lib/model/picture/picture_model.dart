import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'picture_model.freezed.dart';

@freezed
class PictureModel with _$PictureModel {
  const factory PictureModel({
    required String name,
    required String url,
    required String id,
  }) = _PictureModel;

  factory PictureModel.fromFirestore(DocumentSnapshot snapshot) {
    String name;
    String url;
    try {
      final data = snapshot.data() as Map<String, dynamic>;
      name = data['name'] as String;
      url = data['url'] as String;
      debugPrint("PictureModel fromFirestore: $name, $url");
      return PictureModel(
        name: name,
        url: url,
        id: snapshot.id,
      );
    } catch (e) {
      debugPrint("PictureModel fromFirestore error: $e");
    } finally {
      // ignore: control_flow_in_finally
    }
    throw Exception("PictureModel fromFirestore error");
  }
}
