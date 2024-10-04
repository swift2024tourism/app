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
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(250, 90),
                    backgroundColor: Color.fromARGB(255, 62, 209, 235),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0))),
                child: const Text(
                  'クリックでスタート',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                )),
          ])),
    );
  }
}
