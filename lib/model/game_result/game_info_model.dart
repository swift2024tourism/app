import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_info_model.freezed.dart';
part 'game_info_model.g.dart';

@freezed
class GameInfoModel with _$GameInfoModel {
  const factory GameInfoModel({
    required int id,
    required String gameId,
    required String waypointId,
    required int round,
    required int score,
    required double lat,
    required double lon,
    required double distanceFromGoal,
  }) = _GameInfoModel;

  factory GameInfoModel.fromJson(Map<String, Object?> json) =>
      _$GameInfoModelFromJson(json);
}
