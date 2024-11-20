import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GameTutorial extends StatelessWidget {
  const GameTutorial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            color: const Color(0xFF4A789C),
            child: const SafeArea(
              child: Text(
                'このゲームの遊び方',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    '撮影された場所には、',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '次のような ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
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
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    '「手がかり」の例',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
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
                    'このような建物の配置や距離などを画像から',
                    style: TextStyle(fontSize: 16),
                  ),
                  const Text(
                    '推測しよう。',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'ある程度場所が定まったら、撮影場所へ行き',
                    style: TextStyle(fontSize: 16),
                  ),
                  const Text(
                    'お題の写真を見比べて撮影場所と微調整しよう',
                    style: TextStyle(fontSize: 16),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 70,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.arrow_back, color: Colors.black, size: 16),
                              Text('前へ', style: TextStyle(color: Colors.black, fontSize: 12)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Text(
                        '3/3',
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        width: 70,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('次へ', style: TextStyle(color: Colors.black, fontSize: 12)),
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
                            // ゲーム開始処理
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
            ),
          ),
        ],
      ),
    );
  }
}
