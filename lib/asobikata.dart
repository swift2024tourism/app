import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Asobikata extends StatelessWidget {
  const Asobikata({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFCC14A),
        elevation: 0,
      ),
      body: Column(children: <Widget>[
        Container(
          height: 40,
          decoration: const BoxDecoration(
            color: Color(0xFFFCC14A),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
          child: const Center(
            child: Text(
              'このゲームの遊びかた',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 80),
        const Center(
          child: Text(
            '撮影されている場所がどこか\n実際に歩いて探そう!',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 50),
        const Center(
          child: Text(
            'ゲームでは2枚1組の写真が表示されます\nその写真で写っている建物や記念碑などを\n手がかりに撮影場所を実際に歩いて探します',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          '撮影場所についたら、決定ボタンを押します!',
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
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
                  context.push('/tyuuigaki');
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(50, 55),
                    backgroundColor: const Color.fromARGB(255, 68, 122, 156),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: const Text(
                  '次へ',
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
