import 'package:app/model/enums/difficulty_model.dart';
import 'package:app/model/game/game_model.dart';
import 'package:app/model/game_result/game_result_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'current_game_state.freezed.dart';

@freezed
class CurrentGameState with _$CurrentGameState {
  @Assert('currentWaypointIndex >= 0')
  @Assert('currentPictureIndex >= 0')
  const factory CurrentGameState({
    @Default(Difficulty.easy) Difficulty difficulty,
    GameModel? currentGame,
    GeoPoint? currentLocation,
    @Default(0) int currentWaypointIndex,
    @Default(0) int currentPictureIndex,
    GameResultModel? gameResult,
  }) = _CurrentGameState;

  // クラスメソッドのため
  // ignore: unused_element
  const CurrentGameState._();

  bool isWaypointIndexIncrementable() {
    return currentWaypointIndex < currentGame!.waypoints.length - 1;
  }

  bool isPictureIndexIncrementable() {
    return currentPictureIndex < currentGame!.waypoints[currentWaypointIndex].pictures.length - 1;
  }

  bool isWaypointIndexDecrementable() {
    return currentWaypointIndex > 0;
  }

  bool isPictureIndexDecrementable() {
    return currentPictureIndex > 0;
  }
}
