import 'dart:math';

import 'package:app/model/enums/difficulty_model.dart';
import 'package:app/model/game_model.dart';
import 'package:app/repository/games_repository.dart';
import 'package:app/state/current_game_state.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_game_view_model.g.dart';

@Riverpod(keepAlive: true)
class CurrentGameViewModel extends _$CurrentGameViewModel {
  @override
  Future<CurrentGameState> build() async {
    return const CurrentGameState(
      currentGame: null,
    );
  }

  Future<void> initGame(Difficulty difficulty) async {
    state = const AsyncLoading();

    final games = await ref.read(getGamesByDifficultyProvider(difficulty));

    final monoGame = getMonoGame(games);
    debugPrint("now start game: ${monoGame.name}");

    state = AsyncData(CurrentGameState(currentGame: monoGame));
  }

  Future<void> finishGame() async {
    state.whenData((CurrentGameState data) {
      debugPrint("finish game: ${data.currentGame!.name}");
    });
  }

  /// Get a random game from the list of games
  GameModel getMonoGame(List<GameModel> games) {
    final randomIndex = Random().nextInt(games.length);
    return games[randomIndex];
  }

  void nextWaypoint() {
    state.whenData((CurrentGameState value) {
      if (value.isWaypointIndexIncrementable()) {
        state = AsyncData(value.copyWith(currentWaypointIndex: value.currentWaypointIndex + 1));
      }
    });
  }

  void previousWaypoint() {
    state.whenData((CurrentGameState value) {
      if (value.isWaypointIndexDecrementable()) {
        state = AsyncData(value.copyWith(currentWaypointIndex: value.currentWaypointIndex - 1));
      }
    });
  }

  void nextPicture() {
    state.whenData((CurrentGameState value) {
      if (value.isPictureIndexIncrementable()) {
        state = AsyncData(value.copyWith(currentPictureIndex: value.currentPictureIndex + 1));
      }
    });
  }

  void previousPicture() {
    state.whenData((CurrentGameState value) {
      if (value.isPictureIndexDecrementable()) {
        state = AsyncData(value.copyWith(currentPictureIndex: value.currentPictureIndex - 1));
      }
    });
  }
}
