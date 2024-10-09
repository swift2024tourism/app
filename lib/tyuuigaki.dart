import 'package:flutter/material.dart';

class Tyuuigaki extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
        body: Column(children: <Widget>[
      const Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(top: 100.0),
          child: Text(
            'ゲームを安全に楽しむために',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: screenSize.height * 0.6,
            margin: EdgeInsets.only(left: 25.0),
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            height: screenSize.height * 0.6,
            margin: EdgeInsets.only(right: 10.0),
            padding: EdgeInsets.all(20.0),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const Text('ゲームをする際は周囲の\n交通状況にご注意ください。',
                    style: TextStyle(fontSize: 15)),
                const Text(
                    '歩きながらスマートフォンを\n操作する行為は思わぬ重大な\n事故になる可能性があります。\n絶対におやめください。',
                    style: TextStyle(fontSize: 15)),
                const Text(
                    '観光名所には立ち入り禁止\nエリアがあります。\n立ち入り禁止エリアには\n入らないようにお願いします。',
                    style: TextStyle(fontSize: 15)),
              ],
            ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(50, 55),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0))),
              child: const Text(
                'メニューへ',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(50, 55),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0))),
              child: const Text(
                'ゲームを始める',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    ]));
  }
}
