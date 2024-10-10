import 'package:app/state/current_game_state.dart';
import 'package:app/view_model/current_game_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameResult extends StatelessWidget {
  const GameResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        children: [GameResultTop()],
      ),
    );
  }
}

class GameResultTop extends ConsumerWidget {
  const GameResultTop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(currentGameViewModelProvider).maybeWhen(
        orElse: () => const CircularProgressIndicator(),
        data: (CurrentGameState data) {
          return Column(children: [
            const Text('Game Result'),
            Text("結果は：${data.gameResult!.score.toString()}"),
            Text("距離は：${data.gameResult!.meterDistanceFromAnswer.toString()}m"),
            Text(
                "現在地は：${data.currentLocation!.latitude.toString()}, ${data.currentLocation!.longitude.toString()}"),
            Text(
                "目的地は：${data.currentGame!.waypoints[data.currentWaypointIndex].geopoint.latitude.toString()}, ${data.currentGame!.waypoints[data.currentWaypointIndex].geopoint.longitude.toString()}")
          ]);
        });
  }
}
