import 'dart:math';

import 'package:app/model/enums/difficulty_model.dart';
import 'package:app/model/game_model.dart';
import 'package:app/repository/games_repository.dart';
import 'package:app/state/current_game_state.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_game_view_model.g.dart';

@riverpod
class CurrentGameViewModel extends _$CurrentGameViewModel {
  @override
  Future<CurrentGameState> build() async {
    return const CurrentGameState(
      currentGame: null,
    );
  }

  Future<void> initGame(Difficulty difficulty, BuildContext? context) async {
    state = const AsyncLoading();
    final games = await ref.read(getGamesByDifficultyProvider(difficulty));

    final monoGame = getMonoGame(games);

    state = AsyncData(CurrentGameState(currentGame: monoGame));
  }

  /// Get a random game from the list of games
  GameModel getMonoGame(List<GameModel> games) {
    final randomIndex = Random().nextInt(games.length);
    return games[randomIndex];
  }
}
