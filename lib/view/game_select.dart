import 'package:app/model/enums/difficulty_model.dart';
import 'package:app/model/game/game_model.dart';
import 'package:app/repository/games_repository.dart';
import 'package:app/view_model/current_game_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class GameSelect extends ConsumerWidget {
  final Difficulty difficulty;
  const GameSelect(
    this.difficulty, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xFF4A789C),
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: Column(children: <Widget>[
          Container(
            height: 60,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 68, 122, 156),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: const Center(
              child: Text(
                '場所選択',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 80),
          Expanded(
              child: FutureBuilder(
                  future: ref.watch(getGamesByDifficultyProvider(difficulty)),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      List<GameModel> games = snapshot.data;

                      return Column(
                        children: games.map((game) {
                          return OutlinedButton(
                              onPressed: () async {
                                await ref.watch(currentGameViewModelProvider.notifier).initGame(difficulty, games.indexOf(game));
                                WidgetsBinding.instance.addPostFrameCallback((timeStamp) => context.push('/game'));
                              },
                              style: OutlinedButton.styleFrom(
                                  minimumSize: const Size(320, 90),
                                  side: const BorderSide(color: Color(0xFF4A789C), width: 1.5),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  backgroundColor: Colors.white),
                              child: Text(
                                game.name,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF4A789C),
                                ),
                              ));
                        }).toList(),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  })),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton(
                onPressed: () {
                  context.pop();
                },
                backgroundColor: const Color.fromARGB(192, 218, 218, 218),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ]));
  }
}
