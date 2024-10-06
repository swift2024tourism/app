import 'package:app/model/game_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'games_repository.g.dart';

abstract class IGamesRepository {
  Future<List<GameModel>> getAllGames();
}

@riverpod
IGamesRepository gamesRepository(ref) {
  return GamesRepository(FirebaseFirestore.instance.collection("games"));
}

class GamesRepository extends IGamesRepository {
  final CollectionReference<Map<String, dynamic>> gamesCollectionRef;
  GamesRepository(this.gamesCollectionRef);

  @override
  Future<List<GameModel>> getAllGames() async {
    List<GameModel> games = [];
//    games = await read(gamesCollectionRef).get().then((QuerySnapshot<Object?> snapshot) async {
//      return games = await Future.wait(snapshot.docs.map((QueryDocumentSnapshot<Object?> documentSnapshot) async {
//        return await GameModel.fromFirestore(documentSnapshot as DocumentSnapshot<Map<String, dynamic>>);
//      }));
//    });
    games = await gamesCollectionRef.get().then((QuerySnapshot<Object?> snapshot) async {
      return games = await Future.wait(snapshot.docs.map((QueryDocumentSnapshot<Object?> documentSnapshot) async {
        return await GameModel.fromFirestore(documentSnapshot as DocumentSnapshot<Map<String, dynamic>>);
      }));
    });

    return games;
  }
}
