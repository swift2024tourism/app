import 'dart:core';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String columnId = '_id';
final String tableGame = 'game_history';
final String columngameID = 'game_id';
final String columnwaypointId = 'waypoint';
final String columnround = 'round';
final String columnscore = 'score';
final String columnlat = 'lat';
final String columnlon = 'lon';
final String columndistance_from_goal = 'distance_from_goal';

class GameInfo {
  late int id;
  late String waypointId;
  late String gameid;
  late int round;
  late int score;
  late double lat;
  late double lon;
  late double distancefromgoal;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnwaypointId: waypointId,
      columngameID: gameid,
      columnround: round,
      columnscore: score,
      columnlat: lat,
      columnlon: lon,
      columndistance_from_goal: distancefromgoal
    };

    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  GameInfo();

  GameInfo.fromMap(Map<String, Object?> map) {
    id = int.parse(map[columnId].toString());
    gameid = map[columngameID].toString();
    round = int.parse(map[columnId].toString());
    score = int.parse(map[columnscore].toString());
    lat = double.parse(map[columnlat].toString());
    lon = double.parse(map[columnlon].toString());
    distancefromgoal = double.parse(map[columndistance_from_goal].toString());
  }
}

class GameInfoProvider {
  late Database db;

  Future open(String path) async {
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
create table $tableGame(
$columnId integer primary key autoincrement,
$columngameID text not null,
$columnwaypointId text not null,
$columnround integer,
$columnscore integer not null,
$columnlat real not null,
$columnlon real not null,
$columndistance_from_goal real not null
)
''');
    });
  }

  Future<GameInfo> insert(GameInfo gameinfo) async {
    gameinfo.id = await db.insert(tableGame, gameinfo.toMap());
    return gameinfo;
  }

  Future<GameInfo?> getGameinfo(int id) async {
    List<Map> maps = await db.query(tableGame,
        columns: [
          columnId,
          columngameID,
          columnwaypointId,
          columnround,
          columnscore,
          columnlat,
          columnlon,
          columndistance_from_goal
        ],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return GameInfo.fromMap(maps.first as Map<String, Object?>);
    }
    return null;
  }

  Future<int> delete(int id) async {
    return await db.delete(tableGame, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(GameInfo gameinfo) async {
    return await db.update(tableGame, gameinfo.toMap(),
        where: '$columnId = ?', whereArgs: [gameinfo.id]);
  }

  Future close() async => db.close();
}
