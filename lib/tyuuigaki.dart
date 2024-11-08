import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Tyuuigaki extends StatelessWidget {
  const Tyuuigaki({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xFFE63746),
          elevation: 0,
        ),
        body: Column(children: <Widget>[
          Container(
            height: 40,
            decoration: const BoxDecoration(
              color: Color(0xFFE63746),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: const Center(
              child: Text(
                'ゲームを安全に楽しむために',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: screenSize.height * 0.55,
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        //アイコン画像を入れる？
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: screenSize.height * 0.55,
                  padding: const EdgeInsets.all(20.0),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('ゲームをする際は周囲の\n交通状況にご注意ください。',
                          style: TextStyle(fontSize: 15)),
                      Text(
                          '歩きながらスマートフォンを\n操作する行為は思わぬ重大な\n事故になる可能性があります。\n絶対におやめください。',
                          style: TextStyle(fontSize: 15)),
                      Text(
                          '観光名所には立ち入り禁止\nエリアがあります。\n立ち入り禁止エリアには\n入らないようにお願いします。',
                          style: TextStyle(fontSize: 15)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.pop();
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(50, 55),
                      backgroundColor: Color.fromARGB(192, 218, 218, 218),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    'メニューへ',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
                const SizedBox(height: 145),
                ElevatedButton(
                  onPressed: () {
                    context.pop();
                    context.push('/nannido');
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(50, 55),
                      backgroundColor: const Color.fromARGB(255, 68, 122, 156),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    'ゲームを始める',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
        ]));
  }
}
