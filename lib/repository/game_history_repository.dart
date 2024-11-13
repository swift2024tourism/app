import 'dart:convert';

import 'package:app/model/game_result/game_info_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'game_history_repository.g.dart';

@Riverpod(keepAlive: true)
GameHistoryRepository gameHistoryRepository(ref) {
  return GameHistoryRepository();
}

class GameHistoryRepository {
  SharedPreferences? _prefs;
  final String _gameInfoListKey = 'gameInfoList';

  /// ゲームの結果をshared_preferencesに保存する
  Future<void> saveGameInfo(GameInfoModel gameInfo) async {
    _prefs ??= await SharedPreferences.getInstance();
    final gameInfoList = _prefs?.getStringList(_gameInfoListKey) ?? [];

    List<GameInfoModel> gameInfos = [];
    gameInfoList.forEach((value) {
      gameInfos.add(GameInfoModel.fromJson(jsonDecode(value)));
    });

    gameInfos.add(gameInfo);

    await _prefs?.setStringList(
        _gameInfoListKey, gameInfos.map((e) => jsonEncode(e)).toList());
  }

  Future<List<GameInfoModel>> getGameInfos() async {
    _prefs ??= await SharedPreferences.getInstance();
    final gameInfoList = _prefs?.getStringList(_gameInfoListKey) ?? [];

    List<GameInfoModel> gameInfos = [];
    gameInfoList.forEach((value) {
      gameInfos.add(GameInfoModel.fromJson(jsonDecode(value)));
    });

    return gameInfos;
  }
}
