import 'package:flutter/material.dart';

class Tyuuigaki extends StatelessWidget {
  get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text('ゲームを安全に楽しむために'),
              Text('ゲームをする際は周囲の交通状況にご注意ください。'),
              Text('歩きながらスマートフォンを操作する行為は思わぬ重大な事故になる可能性があります。'),
              Text('絶対におやめください。'),
              Text('観光名所には立ち入り禁止エリアがあります。'),
              Text('立ち入り禁止エリアには入らないようにお願いします。'),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {},
                      child: Text('メニューへ'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('ゲームを始める'),
                    ),
                  ])
            ],
          )
        ],
      ),
    );
  }
}
