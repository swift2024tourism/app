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

import 'package:vector_math/vector_math_64.dart';

part 'current_game_view_model.g.dart';

@riverpod
class CurrentGameViewModel extends _$CurrentGameViewModel {
  // 定数の定義
  static const double INNER_RADIUS = 5.0; // 満点を取得できる内側の円の半径（メートル）
  static const double OUTER_RADIUS = 10.0; // 得点圏の外側の円の半径（メートル）
  static const int MAX_SCORE = 100; // 最高得点
  static const int MIN_SCORE = 0; // 最低得点（外側の円の境界上でのスコア）

  @override
  Future<CurrentGameState> build() async {
    debugPrint("CurrentGameViewModel build");
    return const CurrentGameState(
      currentGame: null,
    );
  }

  // スコアを計算するメソッド
  int calculateScore(double distance) {
    if (distance <= INNER_RADIUS) {
      // 内側の円（5m以内）なら100点
      return MAX_SCORE;
    } else if (distance <= OUTER_RADIUS) {
      // 外側の円（5-10m）なら距離に応じて50-100点の間で線形に減少
      // 線形補間を使用してスコアを計算
      double scoreRange = (MAX_SCORE - MIN_SCORE).toDouble();
      double distanceRatio = (OUTER_RADIUS - distance) / (OUTER_RADIUS - INNER_RADIUS);
      return (MIN_SCORE + (scoreRange * distanceRatio)).round();
    } else {
      // 円の外（10m以上）なら50点
      return MIN_SCORE;
    }
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

          if (await Permission.location.request().isGranted ||
              permission == LocationPermission.whileInUse ||
              permission == LocationPermission.always) {
            Position current = await Geolocator.getCurrentPosition();
            debugPrint("current: ${current.latitude}, ${current.longitude}");

            GeoPoint target = data.currentGame!.waypoints[data.currentWaypointIndex].geopoint;
            final double distance = Geolocator.distanceBetween(current.latitude, current.longitude, target.latitude, target.longitude);
            debugPrint("距離は: $distance");

            double direction = Geolocator.bearingBetween(current.latitude, current.longitude, target.latitude, target.longitude);
            debugPrint(calculateBearing(current.latitude, current.longitude, target.latitude, target.longitude).toString());
            direction = radians(calculateBearing(current.latitude, current.longitude, target.latitude, target.longitude)) + pi - pi / 2;
            // 距離に基づいてスコアを計算
            int score = calculateScore(distance);
            debugPrint("Distance: ${distance.toInt()}m, Score: $score");

            state = AsyncData(data.copyWith(
                currentLocation: GeoPoint(current.latitude, current.longitude),
                gameResult:
                    GameResultModel(score: score, meterDistanceFromAnswer: distance.toInt(), directionFromCurrentLocation: direction)));
            debugPrint("direction: $direction");
            return true;
          } else {
            return false;
          }
        },
        orElse: () => false);
  }

  double calculateBearing(double lat1, double lon1, double lat2, double lon2) {
    // 緯度経度をラジアンに変換
    double lat1Rad = lat1 * pi / 180;
    double lon1Rad = lon1 * pi / 180;
    double lat2Rad = lat2 * pi / 180;
    double lon2Rad = lon2 * pi / 180;

    // 方位角を計算
    double dLon = lon2Rad - lon1Rad;
    double y = sin(dLon) * cos(lat2Rad);
    double x = cos(lat1Rad) * sin(lat2Rad) - sin(lat1Rad) * cos(lat2Rad) * cos(dLon);
    double bearingRad = atan2(y, x);

    // ラジアンを度に変換
    double bearingDeg = bearingRad * 180 / pi;

    // 方位角を0-360度の範囲に調整
    return (bearingDeg + 360) % 360;
  }

  /// Get a random game from the list of games
  GameModel getMonoGame(List<GameModel> games) {
    final randomIndex = Random().nextInt(games.length);
    return games[randomIndex];
  }

  bool nextWaypoint() {
    bool result = false;
    state.whenData((CurrentGameState value) {
      debugPrint("currentWaypointIndex: ${value.currentWaypointIndex}");
      if (value.isWaypointIndexIncrementable()) {
        state = AsyncData(value.copyWith(currentWaypointIndex: value.currentWaypointIndex + 1, currentPictureIndex: 0));
        result = true;
      }
    });
    return result;
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
