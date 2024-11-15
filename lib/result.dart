import 'package:app/view_model/current_game_view_model.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScoreScreen extends ConsumerWidget {
  const ScoreScreen({super.key});

  Future<List<Map<String, dynamic>>> fetchRoundData() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      {'round': 1, 'score': 89, 'deviation': '31m'},
      {'round': 2, 'score': 91, 'deviation': '21m'},
      {'round': 3, 'score': 52, 'deviation': '56m'},
      {'round': 4, 'score': 26, 'deviation': '81m'},
      {'round': 5, 'score': 95, 'deviation': '10m'},
      {'round': 6, 'score': 97, 'deviation': '9.4m'},
      {'round': 7, 'score': 86, 'deviation': '27m'},
      {'round': 8, 'score': 89, 'deviation': '30m'},
    ];
  }

  @override
  Widget build(BuildContext context, ref) {
    double averageScore = ref.watch(currentAverageScoreProvider);

    int starCount;
    String imageAssetPath;
    if (averageScore >= 85) {
      starCount = 3;
      imageAssetPath = 'assets/images/Excellent.png';
    } else if (averageScore <= 40) {
      imageAssetPath = 'assets/images/WellDone.png';
      starCount = 1;
    } else {
      imageAssetPath = 'assets/images/GreatJob.png';
      starCount = 2;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A789C),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchRoundData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('データの取得に失敗しました: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('データがありません'));
          }

          final rounds = snapshot.data!;

          //AppBar
          return Column(
            children: <Widget>[
              Container(
                height: 40,
                decoration: const BoxDecoration(
                  color: Color(0xFF4A789C),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'エリア合計',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              // 平均得点、Great Job!、星評価のセクション
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 60),
                          const Text(
                            '平均得点',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            averageScore.toString(),
                            style: const TextStyle(
                              fontSize: 80,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFCC14A),
                            ),
                          ),
                        ]),
                    Column(
                      children: [
                        Image.asset(
                          imageAssetPath,
                          width: 230,
                          height: 80, // 必要に応じてサイズ調整
                        ),

                        // 星の評価
                        Row(
                          children: List.generate(starCount, (index) {
                            return Image.asset(
                              'assets/images/Vector5.png', // 塗りつぶし星の画像
                              width: 60,
                              height: 60,
                            );
                          })
                              .followedBy(
                                List.generate(3 - starCount, (index) {
                                  return Image.asset(
                                    'assets/images/Vector6.png', // 空の星の画像
                                    width: 60,
                                    height: 60,
                                  );
                                }),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Rounds List Header and ListView
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          'ラウンド',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(133, 22, 22, 22),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          'スコア',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(133, 22, 22, 22),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          '撮影地との誤差',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(133, 22, 22, 22),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: rounds.length,
                  itemBuilder: (context, index) {
                    final round = rounds[index];
                    final score = round['score'] as int;

                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey[300]!,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Text(
                                '${round['round']}',
                                style: const TextStyle(
                                  fontSize: 30,
                                  color: Color.fromARGB(133, 22, 22, 22),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Text(
                                '$score',
                                style: const TextStyle(
                                  color: Color(0xFF4A789C),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Text(
                                '${round['deviation']}',
                                style: const TextStyle(
                                  color: Color(0xFF4A789C),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              // Bottom Button
              Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber[400],
                    minimumSize: const Size(250, 80),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'トップへ戻る',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
