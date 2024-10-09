import 'package:app/model/enums/difficulty_model.dart';
import 'package:app/view_model/current_game_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Splash extends ConsumerWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
        future: _init(ref),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            WidgetsBinding.instance
                .addPostFrameCallback((timeStamp) => context.go('/game'));
            return const SizedBox.shrink();
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }

  Future<void> _init(WidgetRef ref) async {
    await Future.delayed(const Duration(seconds: 1));
    await ref
        .read(currentGameViewModelProvider.notifier)
        .initGame(Difficulty.hard);
    debugPrint("init done");
  }
}
