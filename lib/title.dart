import 'package:flutter/material.dart';

class TitleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
            const Text('Application',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                )),
            ElevatedButton(
              onPressed: null,
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(250, 90),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0))),
              child: const Text('クリックしてスタート', style: TextStyle(fontSize: 20)),
            ),
          ])),
    );
  }
}
