// ignore_for_file: prefer_const_constructors

import 'package:app/model/enums/difficulty_model.dart';
import 'package:app/repository/games_repository.dart';
import 'package:app/view_model/current_game_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Nannido extends StatelessWidget {
  const Nannido({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 150),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
            OutlinedButton(
              onPressed: () {
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) => context.push('/game/select/easy'));
              },
              style: OutlinedButton.styleFrom(minimumSize: const Size(150, 100), textStyle: TextStyle(fontSize: 50)),
              child: Text('函館が初めての人'),
            ),
          ]),
          Container(
            padding: EdgeInsets.only(top: 100),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
            OutlinedButton(
              onPressed: () {
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) => context.push('/game/select/medium'));
              },
              style: OutlinedButton.styleFrom(minimumSize: const Size(150, 100), textStyle: TextStyle(fontSize: 50)),
              child: Text('函館に来たことがある人'),
            ),
          ]),
          Container(
            padding: EdgeInsets.only(top: 100),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
            Consumer(builder: (context, ref, _) {
              return OutlinedButton(
                onPressed: () async {
                  // ignore: unused_result
                  await ref.refresh(getGamesByDifficultyProvider(Difficulty.hard));
                  await ref.watch(currentGameViewModelProvider.notifier).initGame(Difficulty.hard, null);
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) => context.push('/game'));
                },
                style: OutlinedButton.styleFrom(minimumSize: const Size(150, 100), textStyle: TextStyle(fontSize: 50)),
                child: const Text('函館に詳しい人'),
              );
            }),
          ]),
        ],
      ),
    );
  }
}
