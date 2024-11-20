import 'package:app/model/game_result/game_info_model.dart';
import 'package:app/repository/game_history_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showWelcomeDialog();
    });
  }

  void _showWelcomeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white,
          title: const Text(
            'ゲームを安全に楽しむために',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFE63746),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 350,
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
        //automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Container(
                height: 40,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 68, 122, 156),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'メインメニュー',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 80),
                    ElevatedButton(
                      onPressed: () {
                        context.push('/asobikata');
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(320, 90),
                        backgroundColor: const Color(0xFFFCC14A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'このゲームのあそびかた',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(320, 90),
                        backgroundColor: const Color(0xFFE63746),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        '実績',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        context.push('/nannido');
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(320, 250),
                        alignment: Alignment.centerLeft,
                        backgroundColor: const Color.fromARGB(255, 68, 122, 156),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'ゲームを始める',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: _showWelcomeDialog,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: const Color(0xFF4A789C),
              ),
              child: const Text(
                'ヘルプ',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
