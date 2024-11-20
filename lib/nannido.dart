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
                  // borderRadiusを削除して四角にする
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
