import 'package:app/kakuninnyou.dart';
import 'package:app/model/enums/difficulty_model.dart';
import 'package:app/model/game/game_model.dart';
import 'package:app/view_model/current_game_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Game extends StatefulWidget {
  Game({super.key});
  bool isGetResult = false;

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  final viewTransformationController = TransformationController();
  int cycleCount = 1;

  @override
  void initState() {
    super.initState();
    final zoom = 0.15;
    viewTransformationController.value.setEntry(0, 0, zoom);
    viewTransformationController.value.setEntry(1, 1, zoom);
    viewTransformationController.value.setEntry(2, 2, zoom);
  }

  @override
  Widget build(BuildContext context) {
    /*

                  Container( height: 120,
                    color: const Color(0xFF4A789C),
                    alignment: Alignment.center,
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        '撮影場所はどこか探そう',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
  */
    return Scaffold(
      body: Consumer(builder: (context, ref, _) {
        return Stack(
          children: [
            ref.watch(currentGameViewModelProvider).maybeWhen(
                orElse: () => const CircularProgressIndicator(),
                data: (state) {
                  GameModel currentGame = state.currentGame!;
                  return OverflowBox(
                    child: InteractiveViewer(
                        minScale: 0.1,
                        onInteractionEnd: (details) =>
                            debugPrint(details.toString()),
                        constrained: false,
                        transformationController: viewTransformationController,
                        child: CachedNetworkImage(
                          progressIndicatorBuilder:
                              (context, _, downloadProcess) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          imageUrl: currentGame
                              .waypoints[state.currentWaypointIndex]
                              .pictures[state.currentPictureIndex]
                              .url,
                        )),
                  );
                }),
            Container(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer(builder: (context, ref, _) {
                    return ref.watch(currentGameViewModelProvider).maybeWhen(
                        orElse: () => const CircularProgressIndicator(),
                        data: (state) {
                          var currentWaypoint = state.currentGame!
                              .waypoints[state.currentWaypointIndex];
                          var currentPictureIndex = state.currentPictureIndex;
                          String leftButtonText = "";
                          // if (currentWaypoint.pictures.contains(currentPictureIndex--)) {
                          if (currentWaypoint.pictures
                              .asMap()
                              .containsKey(currentPictureIndex - 1)) {
                            leftButtonText =
                                "${currentWaypoint.pictures[currentPictureIndex - 1].name}へ";
                          }
                          String rightButtonText = "";
                          // if (currentWaypoint.pictures.contains(currentPictureIndex++)) {
                          if (currentWaypoint.pictures
                              .asMap()
                              .containsKey(currentPictureIndex + 1)) {
                            rightButtonText =
                                "${currentWaypoint.pictures[currentPictureIndex + 1].name}へ";
                          }
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // 前の写真へ
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: (leftButtonText.isEmpty)
                                      ? Colors.transparent
                                      : Colors.black.withOpacity(0.3),
                                ),
                                child: IconButton(
                                    onPressed: () {
                                      ref
                                          .read(currentGameViewModelProvider
                                              .notifier)
                                          .previousPicture();
                                    },
                                    icon: Column(
                                      children: [
                                        Icon(
                                          Icons.arrow_back,
                                          size: 60,
                                          color: (leftButtonText.isEmpty)
                                              ? Colors.transparent
                                              : Colors.white,
                                        ),
                                        Text(
                                          leftButtonText,
                                          style: const TextStyle(
                                              color: Colors.white),
                                        )
                                      ],
                                    )),
                              ),
                              // 中央のボタン群
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    widget.isGetResult
                                        ? const CircularProgressIndicator()
                                        : TextButton(
                                            style: TextButton.styleFrom(
                                              textStyle:
                                                  const TextStyle(fontSize: 20),
                                              fixedSize: const Size(230, 65),
                                              backgroundColor: Colors.yellow,
                                            ),
                                            child: const Text(
                                              "決定",
                                            ),
                                            onPressed: () async {
                                              setState(() {
                                                widget.isGetResult = true;
                                              });
                                              bool isSuc = await ref
                                                  .watch(
                                                      currentGameViewModelProvider
                                                          .notifier)
                                                  .finishGame();
                                              debugPrint("isSuc");
                                              debugPrint(isSuc.toString());
                                              if (context.mounted) {
                                                if (isSuc) {
                                                  setState(() {
                                                    cycleCount++;
                                                  });
                                                  context.push('/game/result');
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    const SnackBar(
                                                      content:
                                                          Text('位置情報の権限が必要です'),
                                                    ),
                                                  );
                                                }
                                              }
                                            },
                                          ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  height: 60,
                                                  child: TextButton(
                                                      onPressed: () {
                                                        showDialog(
                                                            context: context,
                                                            builder: (context) =>
                                                                _warningDialog(
                                                                    context));
                                                      },
                                                      child: const Text(
                                                        textAlign:
                                                            TextAlign.center,
                                                        "ゲーム中の\n注意事項",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      )))),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                height: 60,
                                                child: TextButton(
                                                    onPressed: () {},
                                                    child: const Text(
                                                      "操作方法",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ))),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              // 次の写真へ
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: (rightButtonText.isEmpty)
                                      ? Colors.transparent
                                      : Colors.black.withOpacity(0.3),
                                ),
                                child: IconButton(
                                    onPressed: () {
                                      ref
                                          .read(currentGameViewModelProvider
                                              .notifier)
                                          .nextPicture();
                                    },
                                    icon: Column(
                                      children: [
                                        Icon(
                                          color: (rightButtonText.isEmpty)
                                              ? Colors.transparent
                                              : Colors.white,
                                          Icons.arrow_forward,
                                          size: 60,
                                        ),
                                        Text(
                                          rightButtonText,
                                          style: const TextStyle(
                                              color: Colors.white),
                                        )
                                      ],
                                    )),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          );
                        });
                  }),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            // ヘッダー（四角形）
            Container(
              height: 80,
              width: double.infinity,
              color: const Color(0xFF4A789C),
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                'ラウンド$cycleCount',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // 戻るボタン
            Positioned(
              top: 30,
              right: 16,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 32,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('確認'),
                          content:
                              const Text('メインメニューに戻りますか？\nゲームの進行状況は保存されません。'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('キャンセル'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                context.go('/'); // メインメニューに戻る
                              },
                              child: const Text(
                                '戻る',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  // 既存のメソッドはそのまま...
  Widget _warningItem(String text, IconData icon) {
    return Container(
      height: 150,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 80,
          ),
          const SizedBox(width: 20),
          Text(text),
        ],
      ),
    );
  }

  Widget _warningDialog(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                child: Text(
                  "ゲーム中の注意事項",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            _warningItem("ゲームをするときは\n周りの状況をみましょう！", Icons.car_crash),
            _warningItem("ながらスマホは大変危険です\n絶対にやめましょう", Icons.smartphone),
            _warningItem("観光名所の立ち入り禁止\nエリアには入らないように\nしてください", Icons.close),
            ElevatedButton(
                onPressed: () => context.pop(), child: const Text("閉じる")),
          ],
        ),
      ),
    );
  }
}
