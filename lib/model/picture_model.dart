import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'picture_model.freezed.dart';

@freezed
class PictureModel with _$PictureModel {
  const factory PictureModel({
    required String name,
    required String url,
  }) = _PictureModel;

  factory PictureModel.fromFirestore(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return PictureModel(
      name: data['name'] as String,
      url: data['url'] as String,
    );
  }
}
