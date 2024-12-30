import 'package:app/model/enums/difficulty_model.dart';
import 'package:app/repository/games_repository.dart';
import 'package:app/view_model/current_game_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Nannido extends StatefulWidget {
  const Nannido({super.key});

  @override
  State<Nannido> createState() => _NannidoState();
}

class _NannidoState extends State<Nannido> {
  @override
  void initState() {
    super.initState();

    // 画面ビルド後にダイアログを表示
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showWelcomeDialog();
    });
  }

  void _showWelcomeDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white,
          title: const Text(
            '注意事項',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFE63746),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 400,
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 25),
                Text(
                  'ゲームをする際は周囲の\n交通状況にご注意ください。',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 25),
                Text(
                  '歩きながらスマートフォンを\n操作する行為は思わぬ重大な\n事故になる可能性があります。\n絶対におやめください。',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 25),
                Text(
                  '観光名所には立ち入り禁止\nエリアがあります。\n立ち入り禁止エリアには\n入らないようにお願いします。',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4A789C),
              ),
              child: const Text('閉じる', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A789C),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Container(
                height: 60,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 68, 122, 156),
                ),
                child: const Center(
                  child: Text(
                    '難易度設定',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      OutlinedButton(
                        onPressed: () {
                          context.push('/game/select/easy');
                        },
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(300, 100),
                          side: const BorderSide(color: Color(0xFF4A789C), width: 1.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: Colors.white,
                        ),
                        child: const Text(
                          '初級',
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 32, color: Color(0xFF4A789C)),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          context.push('/game/select/medium');
                        },
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(300, 100),
                          side: const BorderSide(color: Color(0xFF4A789C), width: 1.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: Colors.white,
                        ),
                        child: const Text(
                          '中級',
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 32, color: Color(0xFF4A789C)),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          context.push('/game/select/hard');
                        },
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(300, 100),
                          side: const BorderSide(color: Color(0xFF4A789C), width: 1.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: Colors.white,
                        ),
                        child: const Text(
                          '上級',
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 32, color: Color(0xFF4A789C)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton(
                onPressed: () {
                  context.pop();
                },
                backgroundColor: const Color.fromARGB(192, 218, 218, 218),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
