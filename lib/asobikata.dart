import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Asobikata extends StatefulWidget {
  const Asobikata({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
        children: const [
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
                    onPressed: _currentIndex > 0 ? _previousPage : null,
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(60, 60),
                      backgroundColor: _currentIndex > 0 ? const Color.fromARGB(192, 218, 218, 218) : Colors.grey[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "前へ",
                      style: TextStyle(
                        fontSize: 12,
                        color: _currentIndex > 0 ? Colors.black : Colors.grey, // 押せない場合の文字色
                      ),
                    )),
              ),
              Text(
                "${_currentIndex + 1}/3",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: ElevatedButton(
                  onPressed: _currentIndex < 2 ? _nextPage : null,
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(60, 60),
                    backgroundColor: _currentIndex < 2 ? const Color.fromARGB(192, 218, 218, 218) : Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "次へ",
                    style: TextStyle(
                      fontSize: 12,
                      color: _currentIndex < 2 ? Colors.black : Colors.grey, // 押せない場合の文字色
                    ),
                  ),
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
                child: const Text("トップへ戻る", style: TextStyle(color: Colors.black)),
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
                child: const Text("ゲームを始める", style: TextStyle(color: Colors.white)),
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
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: <Widget>[
        const SizedBox(height: 30),
        const Center(
            child: Text(
          'このゲームは写真から撮影場所を\n探し当てるゲームです',
          style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        )),
        const SizedBox(height: 30),
        const Center(
            child: Text(
          '撮影場所からの距離に応じて\n得点が表示されます!\n近ければ近いほど高得点!',
          style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        )),
        Image.asset('images/result.png', width: 300, height: 300),
      ]),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // 上部に配置
          crossAxisAlignment: CrossAxisAlignment.center, // 中央揃え
          children: [
            // 上部のテキスト
            const Padding(
              padding: EdgeInsets.all(16.0), // テキスト周りの余白
              child: Text(
                '難易度とエリアを設定するとこの画面が\n表示され、ゲームがスタートします',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // 背景画像とボタンのStack
            Stack(
              alignment: Alignment.center,
              children: [
                // 背景画像
                Image.asset(
                  'images/gamegamen.png',
                  width: 580, // 固定幅
                  height: 430, // 固定高さ
                  fit: BoxFit.contain,
                ),
                // ボタンを画像と連動させる
                const Positioned(
                  top: 400,
                  left: 230,
                  child: SmallButton(
                    text: "1",
                    dialogText: "ゲームの遊び方を確認できます",
                  ),
                ),
                const Positioned(
                  top: 340,
                  left: 230,
                  child: SmallButton(
                    text: "2",
                    dialogText: "撮影場所が推測できたら\nここをクリック\n撮影場所との距離に応じて\n得点が表示されます",
                  ),
                ),
                const Positioned(
                  top: 380,
                  left: 280,
                  child: SmallButton(
                    text: "3",
                    dialogText: "同じ撮影場所の反対側から撮った\n写真に切り替わります",
                  ),
                ),
                const Positioned(
                  top: 400,
                  left: 140,
                  child: SmallButton(
                    text: "4",
                    dialogText: "ゲーム中の注意事項を確認できます",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SmallButton extends StatelessWidget {
  final String text;
  final String dialogText;

  const SmallButton({super.key, required this.text, required this.dialogText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(30, 30), padding: EdgeInsets.zero, shape: const CircleBorder(), backgroundColor: Colors.red),
      onPressed: () {
        // ダイアログを表示
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    dialogText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 20),
                  // 画面外をタップで戻る説明
                  const Text(
                    '画面外をタップで戻る',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0), // ダイアログの角丸設定
              ),
            );
          },
        );
      },
      child: Text(text, style: const TextStyle(fontSize: 16, color: Colors.white)),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            const Text(
              '撮影された場所には、',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '次のような ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                Text(
                  '「手がかり」',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                Text(
                  ' があります',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              '「手がかり」の例',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Container(
              width: 300, // 任意の幅
              height: 160, // 任意の高さ
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('モニュメント', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 12),
                  Text('特徴的な建物', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 12),
                  Text('道路標識', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 12),
                  Text('看板', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'このような建物の配置や距離などを画像から\n推測しよう。',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'ある程度場所が定まったら、撮影場所へ行き\nお題の写真を見比べて撮影場所と微調整しよう',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
