import 'package:app/model/game_model.dart';
import 'package:app/view_model/current_game_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Game extends StatelessWidget {
  const Game({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer(builder: (context, ref, _) {
        return Stack(
          children: [
            ref.watch(currentGameViewModelProvider).maybeWhen(
                orElse: () => const CircularProgressIndicator(),
                data: (state) {
                  GameModel currentGame = state.currentGame!;
                  return Column(
                    children: [
                      Text(currentGame.name),
                      Image.network(currentGame
                          .waypoints[state.currentWaypointIndex]
                          .pictures[state.currentPictureIndex]
                          .url)
                    ],
                  );
                }),
            Container(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    child: const Text("決定"),
                    onPressed: () async {
                      bool isSuc = await ref
                          .watch(currentGameViewModelProvider.notifier)
                          .finishGame();
                      debugPrint("isSuc");
                      debugPrint(isSuc.toString());
                      if (context.mounted) {
                        if (isSuc) {
                          context.push('/game/result');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('位置情報の権限が必要です'),
                            ),
                          );
                        }
                      }
                    },
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            ref
                                .read(currentGameViewModelProvider.notifier)
                                .previousPicture();
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 60,
                          )),
                      Expanded(
                        child: Container(),
                      ),
                      IconButton(
                          onPressed: () {
                            ref
                                .read(currentGameViewModelProvider.notifier)
                                .nextPicture();
                          },
                          icon: const Icon(
                            Icons.arrow_forward,
                            size: 60,
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
