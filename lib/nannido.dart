import 'package:flutter/material.dart';

class Nannido extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 150),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      minimumSize: const Size(150, 100),
                      textStyle: TextStyle(fontSize: 50)),
                  child: Text('函館が初めての人'),
                ),
              ]),
          Container(
            padding: EdgeInsets.only(top: 100),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      minimumSize: const Size(150, 100),
                      textStyle: TextStyle(fontSize: 50)),
                  child: Text('函館に来たことがある人'),
                ),
              ]),
          Container(
            padding: EdgeInsets.only(top: 100),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      minimumSize: const Size(150, 100),
                      textStyle: TextStyle(fontSize: 50)),
                  child: Text('函館に詳しい人'),
                ),
              ]),
        ],
      ),
    );
  }
}
