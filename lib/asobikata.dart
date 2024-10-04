import 'package:flutter/material.dart';

class Asobikata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 430,
          height: 932,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 53,
                top: 39,
                child: Text(
                  'このゲームの遊び方',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 36,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 56,
                top: 771,
                child: Container(
                  width: 137,
                  height: 44,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 137,
                          height: 44,
                          decoration: ShapeDecoration(
                            color: Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 29,
                        top: 6,
                        child: Text(
                          'メニューへ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 236,
                top: 771,
                child: Container(
                  width: 137,
                  height: 44,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 137,
                          height: 44,
                          decoration: ShapeDecoration(
                            color: Color(0xFF00CCFF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 13,
                        top: 6,
                        child: Text(
                          'ゲームを始める',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 60,
                top: 190,
                child: Text(
                  '撮影されている場所がどこか\n実際に歩いて探そう！',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 72,
                top: 321,
                child: Text(
                  'ゲームでは2枚1組の写真が表示されます\nその写真で写っている建物や記念碑などを\n手がかりに撮影場所を実際に歩いて探します\n\n撮影場所がわかったら、決定ボタンを押します！',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    height: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}