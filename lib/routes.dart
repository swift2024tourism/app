import 'package:app/asobikata.dart';
import 'package:app/mainmenu.dart';
import 'package:app/model/enums/difficulty_model.dart';
import 'package:app/nannido.dart';
import 'package:app/testt/difficulty_mock_view.dart';
import 'package:app/testt/firebase_test.dart';
import 'package:app/title.dart';
import 'package:app/tyuuigaki.dart';
import 'package:app/view/game.dart';
import 'package:app/view/game_result.dart';
import 'package:app/view/game_select.dart';
import 'package:app/view/splash.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => const MaterialPage(child: Splash()),
    ),
    GoRoute(
      path: '/test/firebase',
      pageBuilder: (context, state) => const MaterialPage(child: FirebaseTestView()),
    ),
    GoRoute(path: '/game', pageBuilder: (context, state) => const MaterialPage(child: Game())),
    GoRoute(
        path: '/game/result',
        pageBuilder: (context, state) {
          return const MaterialPage(child: GameResult());
        }),
    GoRoute(
        path: '/game/select/:difficulty',
        pageBuilder: (context, GoRouterState state) {
          debugPrint(state.pathParameters['difficulty']);
          return MaterialPage(child: GameSelect(Difficulty.values.firstWhere((value) => value.name == state.pathParameters['difficulty'])));
        }),
    GoRoute(
        path: '/difficulty',
        pageBuilder: (context, state) {
          return const MaterialPage(child: DifficultyMockView());
        }),
    GoRoute(
        path: '/mainmenu',
        pageBuilder: (context, state) {
          return const MaterialPage(child: MainMenu());
        }),
    GoRoute(path: '/title', pageBuilder: (context, state) => const MaterialPage(child: TitleScreen())),
    GoRoute(path: '/asobikata', pageBuilder: (context, state) => const MaterialPage(child: Asobikata())),
    GoRoute(path: '/tyuuigaki', pageBuilder: (context, state) => const MaterialPage(child: Tyuuigaki())),
    GoRoute(path: '/nannido', pageBuilder: (context, state) => const MaterialPage(child: Nannido())),
  ],
);
