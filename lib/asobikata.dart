import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Asobikata extends StatefulWidget {
  const Asobikata({super.key});

  @override
  _GameTutorialState createState() => _GameTutorialState();
}

class _GameTutorialState extends State<Asobikata> {
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
        title: const Text('このゲームの遊びかた',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
        backgroundColor: const Color(0xFF4A789C),
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
              Container(
                margin: const EdgeInsets.only(right: 40),
                width: 70,
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: TextButton(
                  onPressed: _previousPage,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_back, color: Colors.black, size: 16),
                      Text('前へ',
                          style: TextStyle(color: Colors.black, fontSize: 12)),
                    ],
                  ),
                ),
              ),
              Text(
                "${_currentIndex + 1}/3",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: const EdgeInsets.only(left: 40),
                width: 70,
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: TextButton(
                  onPressed: _nextPage,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('次へ',
                          style: TextStyle(color: Colors.black, fontSize: 12)),
                      Icon(Icons.arrow_forward, color: Colors.black, size: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 160,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: const Text(
                    'トップへ戻る',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Container(
                width: 160,
                height: 45,
                decoration: BoxDecoration(
                  color: const Color(0xFF4A789C),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: TextButton(
                  onPressed: () {
                    context.pop();
                    context.push('/nannido');
                  },
                  child: const Text(
                    'ゲームを始める',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 30),
            const Text(
              'このゲームは写真から撮影場所を\n探し当てるゲームです',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            const Text(
              '撮影場所からの距離に応じて\n得点が表示されます!\n近ければ近いほど高得点!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Image.asset('images/result.png', width: 300, height: 300),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double imageWidth = constraints.maxWidth * 0.8;
            final double imageHeight = imageWidth * 0.75;

            return Stack(
              children: [
                Center(
                  child: Image.asset(
                    'images/gamegamen.png',
                    width: imageWidth,
                    height: imageHeight,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: constraints.maxHeight / 2 + imageHeight * 0.4,
                  left: constraints.maxWidth / 2 - imageWidth * 0.2,
                  child: SmallButton(
                    text: "1",
                    dialogText: "ゲームの遊び方を確認できます",
                  ),
                ),
                Positioned(
                  top: constraints.maxHeight / 2 + imageHeight * 0.3,
                  left: constraints.maxWidth / 2,
                  child: SmallButton(
                    text: "2",
                    dialogText: "撮影場所が推測できたら\nここをクリック\n撮影場所との距離に応じて\n得点が表示されます",
                  ),
                ),
                Positioned(
                  top: constraints.maxHeight / 2 + imageHeight * 0.35,
                  left: constraints.maxWidth / 2 + imageWidth * 0.1,
                  child: SmallButton(
                    text: "3",
                    dialogText: "同じ撮影場所の反対側から撮った\n写真に切り替わります",
                  ),
                ),
                Positioned(
                  top: constraints.maxHeight / 2 + imageHeight * 0.5,
                  left: constraints.maxWidth / 2 - imageWidth * 0.3,
                  child: SmallButton(
                    text: "4",
                    dialogText: "ゲーム中の注意事項を確認できます\nゲーム開始前に必ずお読みください",
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
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
        backgroundColor: Colors.red,
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(
                dialogText,
                textAlign: TextAlign.center,
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            const Text(
              '撮影された場所には、',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '次のような ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '「手がかり」',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                Text(
                  ' があります',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Text(
              '「手がかり」の例',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
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
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'ある程度場所が定まったら、撮影場所へ行き\nお題の写真を見比べて撮影場所と微調整しよう',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
