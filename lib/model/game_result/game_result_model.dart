import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_result_model.freezed.dart';

@freezed
class GameResultModel with _$GameResultModel {
  const factory GameResultModel({
    required int score,
    @Default(100) int maxScore,
    required int meterDistanceFromAnswer,
    required double directionFromCurrentLocation,
  }) = _GameResultModel;
}
