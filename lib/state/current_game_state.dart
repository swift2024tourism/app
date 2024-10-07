import 'package:app/model/game_model.dart';
import 'package:app/model/waypoint.dart';
import 'package:app/repository/games_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'current_game_state.freezed.dart';

@freezed
class CurrentGameState with _$CurrentGameState {
  const factory CurrentGameState({
    GameModel? currentGame,
  }) = _CurrentGameState;
}
