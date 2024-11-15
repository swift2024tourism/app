import 'package:app/asobikata.dart';
import 'package:app/nannido.dart';
import 'package:flutter/material.dart';

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
            const SizedBox(height: 80),
            const Text('くらベル！',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 150),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  blackOut(const Nannido()),
                );
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(280, 130),
                  backgroundColor: const Color.fromARGB(255, 68, 122, 156),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: const Text(
                'ゲームスタート',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(
                  blackOut(const Asobikata()),
                );
              },
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(280, 80),
                side: const BorderSide(color: Color(0xFF4A789C), width: 3.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: Colors.white,
              ),
              child: const Text(
                'あそびかた',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Color.fromARGB(133, 22, 22, 22)),
              ),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(280, 80),
                side: const BorderSide(color: Colors.black, width: 3.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: Colors.white,
              ),
              child: const Text(
                '私のあしあと',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Color.fromARGB(133, 22, 22, 22)),
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

PageRouteBuilder<Object?> blackOut(Widget screen) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionDuration: const Duration(seconds: 1),
    reverseTransitionDuration: const Duration(seconds: 1),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final color = ColorTween(
        begin: Colors.transparent,
        end: Colors.black,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: const Interval(0, 0.5, curve: Curves.easeInOut),
        ),
      );
      final opacity = Tween<double>(
        begin: 0,
        end: 1,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: const Interval(0.5, 1, curve: Curves.easeInOut),
        ),
      );
      return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Container(
            color: color.value,
            child: Opacity(
              opacity: opacity.value,
              child: child,
            ),
          );
        },
        child: child,
      );
    },
  );
}
