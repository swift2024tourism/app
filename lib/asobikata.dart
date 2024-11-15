import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Asobikata extends StatelessWidget {
  const Asobikata({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('このゲームの遊びかた', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 68, 122, 156),
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 100.0,
      ),
      body: Column(children: <Widget>[
        const SizedBox(height: 50),
        const Center(
            child: Text(
          '撮影された場所を歩いて探して\nここだと思ったところで\n「ここに決める」ボタンを押そう！',
          style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        )),
        Image.asset('images/kokonikimeru.png', width: 200, height: 200),
        const Center(
            child: Text(
          'ボタンを押すと、距離に応じて\n得点がつきます\n近ければ近いほど高得点！',
          style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        )),
        const Spacer(),
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
                    backgroundColor: const Color.fromARGB(192, 218, 218, 218),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                child: const Text(
                  'メニューへ戻る',
                  style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
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
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                child: const Text(
                  'ゲームを始める',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 50),
      ]),
    );
  }
}
