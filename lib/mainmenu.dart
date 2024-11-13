import 'package:app/model/game_result/game_info_model.dart';
import 'package:app/repository/game_history_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Scaffold(
                  appBar: AppBar(
                    title: const Text('Second Page'),
                  ),
                  body: Consumer(
                    builder: (context, ref, child) {
                      return FutureBuilder(
                          future: ref.read(gameHistoryRepositoryProvider).getGameInfos(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Center(child: CircularProgressIndicator());
                            }
                            final gameInfos = snapshot.data as List<GameInfoModel>;
                            return ListView.builder(
                                itemCount: gameInfos.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(gameInfos[index].gameId),
                                    subtitle: Row(
                                      children: [
                                        Text(gameInfos[index].score.toString()),
                                        Text(gameInfos[index].distanceFromGoal.toString()),
                                      ],
                                    ),
                                  );
                                });
                          });
                    },
                  ));
            }));
          },
          child: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xFF4A789C),
          elevation: 0,
        ),
        body: Column(children: <Widget>[
          Container(
            height: 40,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 68, 122, 156),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: const Center(
              child: Text(
                'Main Menu',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 80),
                ElevatedButton(
                  onPressed: () {
                    context.push('/asobikata');
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(320, 90),
                      backgroundColor: const Color(0xFFFCC14A),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    'このゲームのあそびかた',
                    style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    context.push('/tyuuigaki');
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(320, 90),
                      backgroundColor: const Color(0xFFE63746),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    'ゲームを安全に楽しむために',
                    style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    context.push('/nannido');
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(320, 250),
                      alignment: Alignment.centerLeft,
                      backgroundColor: const Color.fromARGB(255, 68, 122, 156),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  child: const Text.rich(TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: 'Start the\nGame!\n',
                        style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    TextSpan(
                        text: 'ゲームをはじめる',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ))
                  ])),
                ),
              ],
            ),
          ),
        ]));
  }
}
