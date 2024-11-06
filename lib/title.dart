import 'package:app/mainmenu.dart';
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
            const Text('くらベル！',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 200),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  blackOut(const MainMenu()),
                );
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(250, 80),
                  backgroundColor: const Color.fromARGB(255, 68, 122, 156),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: const Text(
                'ゲームを始める',
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
