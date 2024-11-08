// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            const Text('くらベル！',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 200),
            ElevatedButton(
              onPressed: () {
                context.go('/mainmenu');
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(250, 80),
                  backgroundColor: Color.fromARGB(255, 68, 122, 156),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: const Text(
                'Tap To Start',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              '©Swift 2024 Visitors Team',
              style: TextStyle(fontSize: 13, color: Colors.black),
            ),
          ])),
    );
  }
}
