import 'package:app/model/enums/difficulty_model.dart';
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
        return TextButton(
          child: const Text("難易度：中"),
          onPressed: () async {
            await ref
                .watch(currentGameViewModelProvider.notifier)
                .initGame(Difficulty.medium);
            WidgetsBinding.instance
                .addPostFrameCallback((timeStamp) => context.push('/game'));
          },
        );
      }),
    );
  }
}
