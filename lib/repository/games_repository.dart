import 'package:app/model/enums/difficulty_model.dart';
import 'package:app/model/game/game_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'games_repository.g.dart';

abstract class IGamesRepository {
  Future<List<GameModel>> getAllGames();
  Future<List<GameModel>> getGamesByDifficulty(Difficulty difficulty);
}

// for development use games_test
const gamesCollection = "games_test";

@riverpod
IGamesRepository gamesRepository(ref) {
  return GamesRepository(FirebaseFirestore.instance.collection(gamesCollection));
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
      games.map((value) {
        if (game == null) {
          game = value;
        } else {
          game!.waypoints.addAll(value.waypoints);
        }
      });
      game!.waypoints.shuffle();
      return [game!];
  }
}

class GamesRepository extends IGamesRepository {
  final CollectionReference<Map<String, dynamic>> gamesCollectionRef;
  GamesRepository(this.gamesCollectionRef);

  @override
  Future<List<GameModel>> getAllGames() async {
    List<GameModel> games = [];
    games = await gamesCollectionRef.get().then((QuerySnapshot<Object?> snapshot) async {
      return games = await Future.wait(snapshot.docs.map((QueryDocumentSnapshot<Object?> documentSnapshot) async {
        return await GameModel.fromFirestore(documentSnapshot as DocumentSnapshot<Map<String, dynamic>>);
      }));
    });

    return games;
  }

  @override
  Future<List<GameModel>> getGamesByDifficulty(Difficulty difficulty) async {
    List<GameModel> games = [];

    debugPrint("difficulty: ${difficulty.name}");
    games = await gamesCollectionRef.where("difficulty", isEqualTo: difficulty.name).get().then((QuerySnapshot<Object?> snapshot) async {
      games = await Future.wait(snapshot.docs.map((QueryDocumentSnapshot<Object?> documentSnapshot) async {
        return await GameModel.fromFirestore(documentSnapshot as DocumentSnapshot<Map<String, dynamic>>);
      }));
      return games;
    });

    return games;
  }
}
