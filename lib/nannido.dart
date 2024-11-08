import 'package:app/model/enums/difficulty_model.dart';
import 'package:app/repository/games_repository.dart';
import 'package:app/view_model/current_game_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Nannido extends StatelessWidget {
  // 難易度の定義を定数として管理
  static const Map<String, String> difficultyRoutes = {
    '初級': '/game/select/easy',
    '中級': '/game/select/medium',
    '上級': '/game/select/hard',
  };

  const Nannido({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A789C),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // 前の画面に戻る
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildDifficultyButtons(context),
            _buildBackButton(context), // ここに戻るボタンを追加
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return ClipPath(
      clipper: CustomShapeClipper(),
      child: Container(
        height: 80,
        color: const Color(0xFF4A789C),
        alignment: Alignment.center,
        child: const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            '難易度設定',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDifficultyButtons(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: difficultyRoutes.entries.map((entry) {
            return _buildDifficultyButton(
              text: entry.key,
              route: entry.value,
              context: context,
            );
          }).toList(),
        ),
      ),
    );
  }
  /*

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
  */

  Widget _buildDifficultyButton({
    required String text,
    required String route,
    required BuildContext context,
  }) {
    return Consumer(builder: (context, ref, _) {
      return Container(
        width: double.infinity,
        height: 100,
        child: OutlinedButton(
          onPressed: () async {
            if (route == '/game/select/hard') {
              await ref.refresh(getGamesByDifficultyProvider(Difficulty.hard));
              await ref.read(currentGameViewModelProvider.notifier).initGame(Difficulty.hard, null);
            }
            WidgetsBinding.instance.addPostFrameCallback((timestamp) => context.push(route));
          },
          child: Text(
            text,
            style: TextStyle(
              fontSize: 32,
              color: Color(0xFF4A789C),
              fontWeight: FontWeight.w500,
            ),
          ),
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Color(0xFF4A789C), width: 1.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: Colors.white,
          ),
        ),
      );
    });
  }

  // 戻るボタンを定義
  Widget _buildBackButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () => context.pop(), // 前の画面に戻る
          child: Text(
            '戻る',
            style: TextStyle(fontSize: 24),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xFF4A789C)),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 40,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
