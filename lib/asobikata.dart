import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class Asobikata extends StatefulWidget {
  const Asobikata({super.key});

  @override
  _AsobikataState createState() => _AsobikataState();
}

class _AsobikataState extends State<Asobikata> {
  int _currentIndex = 0;

  void _nextPage() {
    setState(() {
      if (_currentIndex < 2) {
        _currentIndex++;
      }
    });
  }

  void _previousPage() {
    setState(() {
      if (_currentIndex > 0) {
        _currentIndex--;
      }
    });
  }

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
      body: IndexedStack(
        index: _currentIndex,
        children: [
          Page1(),
          Page2(),
          Page3(),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 40),
                child: ElevatedButton(
                  onPressed: _previousPage,
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(60, 60),
                    backgroundColor: const Color.fromARGB(192, 218, 218, 218),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("前へ",
                      style: TextStyle(fontSize: 12, color: Colors.black)),
                ),
              ),
              Text(
                "${_currentIndex + 1}/3",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: ElevatedButton(
                  onPressed: _nextPage,
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(60, 60),
                    backgroundColor: const Color.fromARGB(192, 218, 218, 218),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("次へ",
                      style: TextStyle(fontSize: 12, color: Colors.black)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.pop();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(100, 50),
                  backgroundColor: const Color.fromARGB(192, 218, 218, 218),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child:
                    const Text("トップへ戻る", style: TextStyle(color: Colors.black)),
              ),
              ElevatedButton(
                onPressed: () {
                  context.pop();
                  context.push('/nannido');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(100, 50),
                  backgroundColor: const Color.fromARGB(255, 68, 122, 156),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("ゲームを始める",
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: <Widget>[
        const SizedBox(height: 30),
        const Center(
            child: Text(
          'このゲームは写真から撮影場所を\n探し当てるゲームです',
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        )),
        const SizedBox(height: 50),
        const Center(
            child: Text(
          '撮影場所からの距離に応じて\n得点が表示されます!\n近ければ近いほど高得点!',
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        )),
        Image.asset('images/result.png', width: 300, height: 300),
      ]),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
              const Text(
                '難易度とエリアを設定するとこの画面が\n表示され、ゲームがスタートします',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Stack(
                children: [
                  LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      final imageWidth = constraints.maxWidth; // 画像の幅
                      final imageHeight = constraints.maxHeight; // 画像の高さ

                      return Stack(
                        children: [
                          // 背景画像
                          Image.asset(
                            'images/gamegamen.png',
                            width: 600,
                            height: 450,
                            fit: BoxFit.contain,
                          ),
                          // ボタンを画像と連動させる
                          Positioned(
                            top: imageHeight * 0.05, // 高さの割合で位置を指定
                            left: imageWidth * 0.1, // 幅の割合で位置を指定
                            child: const SmallButton(
                              text: "1",
                              dialogText: "ゲームの遊び方を確認できます",
                            ),
                          ),
                          Positioned(
                            top: imageHeight * 0.85,
                            left: imageWidth * 0.4,
                            child: const SmallButton(
                              text: "2",
                              dialogText:
                                  "撮影場所が推測できたら\nここをクリック\n撮影場所との距離に応じて\n得点が表示されます",
                            ),
                          ),
                          Positioned(
                            top: imageHeight * 0.91,
                            left: imageWidth * 0.55,
                            child: const SmallButton(
                              text: "3",
                              dialogText: "同じ撮影場所の反対側から撮った\n写真に切り替わります",
                            ),
                          ),
                          Positioned(
                            top: imageHeight * 0.95,
                            left: imageWidth * 0.25,
                            child: const SmallButton(
                              text: "4",
                              dialogText: "ゲーム中の注意事項を確認できます\nゲーム開始前に必ずお読みください",
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ])));
  }
}

class SmallButton extends StatelessWidget {
  final String text;
  final String dialogText;

  const SmallButton({required this.text, required this.dialogText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(30, 30),
          padding: EdgeInsets.zero,
          shape: const CircleBorder(),
          backgroundColor: Colors.red),
      onPressed: () {
        // ダイアログを表示
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(
                dialogText, textAlign: TextAlign.center, // 文字を中央寄せ
                style: const TextStyle(fontSize: 16),
              ),
              backgroundColor: Colors.white,
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("閉じる"),
                ),
              ],
            );
          },
        );
      },
      child:
          Text(text, style: const TextStyle(fontSize: 16, color: Colors.white)),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: <Widget>[
        SizedBox(height: 30),
        Center(
            child: Text(
          '撮影された場所には、\n次のような「手がかり」があります',
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        )),
        SizedBox(height: 50),
        Center(
            child: Text(
          'このような建物の配置や距離などを画像から\n推測しよう。\nある程度場所が定まったら、撮影場所へ行き\nお題の写真を見比べて撮影場所と微調整しよう',
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        )),
      ]),
    );
  }
}
