import 'package:app/model/enums/difficulty_model.dart';
import 'package:app/model/game/game_model.dart';
import 'package:app/model/waypoint/waypoint.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'games_repository.g.dart';

abstract class IGamesRepository {
  Future<List<GameModel>> getAllGames();
  Future<List<GameModel>> getGamesByDifficulty(Difficulty difficulty);
}

// for development use games_test
const gamesCollection = "games";

@riverpod
IGamesRepository gamesRepository(ref) {
  var firestore = FirebaseFirestore.instance;
  firestore.settings = const Settings(cacheSizeBytes: -1, persistenceEnabled: true);
  return GamesRepository(firestore.collection(gamesCollection));
}

//Rawで囲うと勝手にAsyncValueにならない
//ref: https://riverpod.dev/docs/essentials/websockets_sync
@Riverpod(keepAlive: true)
Raw<Future<List<GameModel>>> getGamesByDifficulty(GetGamesByDifficultyRef ref, Difficulty difficulty) async {
  switch (difficulty) {
    case Difficulty.easy:
      return await ref.read(gamesRepositoryProvider).getGamesByDifficulty(difficulty);
    case Difficulty.medium:
      List<GameModel> games = await ref.read(gamesRepositoryProvider).getGamesByDifficulty(difficulty);
      games.map<GameModel>((value) {
        value.waypoints.shuffle();
        return value;
      });
      return games;
    case Difficulty.hard:
      List<GameModel> games = await ref.read(gamesRepositoryProvider).getAllGames();

      GameModel? game;
      for (int i = 0; i < games.length; i++) {
        if (game == null) {
          game = games[i];
        } else {
          game = game.copyWith(
            waypoints: game.waypoints + games[i].waypoints,
          );
        }
      }
      // #TODO waypointの順番をランダムにする
      List<Waypoint> shuffledWaypoints = List.from(game!.waypoints)..shuffle();
      game = game.copyWith(waypoints: shuffledWaypoints);

      return [game];
  }
}

class GamesRepository extends IGamesRepository {
  final CollectionReference<Map<String, dynamic>> gamesCollectionRef;
  GamesRepository(this.gamesCollectionRef);

  @override
  Future<List<GameModel>> getAllGames() async {
    List<GameModel> games = [];
    // games = await gamesCollectionRef.get().then((QuerySnapshot<Object?> snapshot) async {
    //   return games = await Future.wait(snapshot.docs.map((QueryDocumentSnapshot<Object?> documentSnapshot) async {
    //     return await GameModel.fromFirestore(documentSnapshot as DocumentSnapshot<Map<String, dynamic>>);
    //   }));
    // });

    games = await gamesCollectionRef.get().then((QuerySnapshot<Object?> snapshot) async {
      games = await Future.wait(snapshot.docs.map((QueryDocumentSnapshot<Object?> documentSnapshot) async {
        debugPrint("documentSnapshot: ${documentSnapshot.data()}");
        return await GameModel.fromFirestore(documentSnapshot as DocumentSnapshot<Map<String, dynamic>>);
      }));
      return games;
    });
    debugPrint("games: ${games.length}");

    return games;
  }

  @override
  Future<List<GameModel>> getGamesByDifficulty(Difficulty difficulty) async {
    List<GameModel> games = [];

    debugPrint("difficulty: ${difficulty.name}");
    games = await gamesCollectionRef.where("difficulty", isEqualTo: difficulty.name).get().then((QuerySnapshot<Object?> snapshot) async {
      games = await Future.wait(snapshot.docs.map((QueryDocumentSnapshot<Object?> documentSnapshot) async {
        debugPrint("load game: ${documentSnapshot.data()}");
        return await GameModel.fromFirestore(documentSnapshot as DocumentSnapshot<Map<String, dynamic>>);
      }));
      return games;
    });

    return games;
  }
}
