import 'package:app/main.dart';
import 'package:app/model/enums/difficulty_model.dart';
import 'package:app/testt/firebase_test.dart';
import 'package:app/view_model/current_game_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Splash extends ConsumerWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
        future: _init(ref),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) =>
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const MyApp()), (route) => true));
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
    await ref.read(currentGameViewModelProvider.notifier).initGame(Difficulty.hard);
  }
}
