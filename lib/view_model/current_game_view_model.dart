import 'dart:math';

import 'package:app/model/enums/difficulty_model.dart';
import 'package:app/model/game/game_model.dart';
import 'package:app/model/game_result/game_result_model.dart';
import 'package:app/repository/games_repository.dart';
import 'package:app/state/current_game_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
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

  Future<void> initGame(Difficulty difficulty, int? gameIndex) async {
    state = const AsyncLoading();

    final games = await ref.read(getGamesByDifficultyProvider(difficulty));

    GameModel game;

    if (gameIndex == null) {
      game = getMonoGame(games);
    } else {
      game = games[gameIndex];
    }
    debugPrint("now start game: ${game.name}");

    state = AsyncData(CurrentGameState(currentGame: game, difficulty: difficulty));
  }

  // 確定ボタンを押された時の処理
  /// if error return false
  Future<bool> finishGame() async {
    return state.maybeWhen(
        data: (CurrentGameState data) async {
          debugPrint("finish game: ${data.currentGame!.name}");
          Map<Permission, PermissionStatus> statuses = await [
            Permission.location,
          ].request();
          var permission = await Geolocator.requestPermission();

          if (permission == LocationPermission.denied && PermissionStatus.granted != statuses[Permission.location]) {
            return false;
          }

          // ユーザーのgps
          // #TODO パーミッションがなかった時の処理を作る
          if (await Permission.location.request().isGranted ||
              permission == LocationPermission.whileInUse ||
              permission == LocationPermission.always) {
            Position current = await Geolocator.getCurrentPosition();
            debugPrint("current: ${current.latitude}, ${current.longitude}");

            // 目的地のgps
            GeoPoint target = data.currentGame!.waypoints[data.currentWaypointIndex].geopoint;
            // 現在地と目的地の間の距離
            double distance = Geolocator.distanceBetween(current.latitude, current.longitude, target.latitude, target.longitude);

            // #TODO スコア計算 score変数に代入しといてください
            int score = 100;
            state = AsyncData(data.copyWith(
                currentLocation: GeoPoint(current.latitude, current.longitude),
                gameResult: GameResultModel(score: score, meterDistanceFromAnswer: distance.toInt())));
            return true;
          } else {
            return false;
          }
        },
        orElse: () => false);
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
