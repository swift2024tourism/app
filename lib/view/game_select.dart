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
        appBar: AppBar(),
        body: FutureBuilder(
            future: ref.watch(getGamesByDifficultyProvider(difficulty)),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                List<GameModel> games = snapshot.data;
                return Column(
                  children: games.map((game) {
                    return TextButton(
                      child: Text(game.name),
                      onPressed: () async {
                        await ref.watch(currentGameViewModelProvider.notifier).initGame(difficulty, games.indexOf(game));
                        WidgetsBinding.instance.addPostFrameCallback((timeStamp) => context.push('/game'));
                      },
                    );
                  }).toList(),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
