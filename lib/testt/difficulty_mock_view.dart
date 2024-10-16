import 'package:app/model/enums/difficulty_model.dart';
import 'package:app/repository/games_repository.dart';
import 'package:app/view_model/current_game_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DifficultyMockView extends StatelessWidget {
  const DifficultyMockView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer(builder: (context, ref, _) {
        return Column(
          children: [
            TextButton(
              child: const Text("難易度：初級"),
              onPressed: () async {
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) => context.push('/game/select/easy'));
              },
            ),
            TextButton(
              child: const Text("難易度：中級"),
              onPressed: () async {
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) => context.push('/game/select/medium'));
              },
            ),
            TextButton(
              child: const Text("難易度：上級"),
              onPressed: () async {
                // ignore: unused_result
                await ref.refresh(getGamesByDifficultyProvider(Difficulty.hard));
                await ref.watch(currentGameViewModelProvider.notifier).initGame(Difficulty.hard, null);
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) => context.push('/game'));
              },
            ),
          ],
        );
      }),
    );
  }
}
