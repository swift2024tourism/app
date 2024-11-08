import 'package:app/firebase_options.dart';
import 'package:app/model/game_result/game_info_model.dart';
import 'package:app/repository/game_history_repository.dart';
import 'package:app/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ProviderScope(child: SharedPrefsTest()));
  //takuto
}

class SharedPrefsTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Text("test"),
            TextButton(
              child: Text("テスト"),
              onPressed: () {
                var gameInfo = GameInfoModel(
                    id: 8,
                    gameId: "gameId",
                    waypointId: "waypointId",
                    round: 1,
                    score: 100,
                    lat: 35.2,
                    lon: 352.3,
                    distanceFromGoal: 642.4);
                var json = gameInfo.toJson();
                var gameInfo2 = GameInfoModel.fromJson(json);
                debugPrint(gameInfo2.gameId);
              },
            ),
            Consumer(builder: (context, ref, _) {
              return TextButton(
                child: Text("保存"),
                onPressed: () {
                  var gameInfo = GameInfoModel(
                      id: 8,
                      gameId: "gameId",
                      waypointId: "waypointId",
                      round: 1,
                      score: 100,
                      lat: 35.2,
                      lon: 352.3,
                      distanceFromGoal: 642.4);

                  ref
                      .read(gameHistoryRepositoryProvider)
                      .saveGameInfo(gameInfo);
                },
              );
            }),
            Consumer(builder: (context, ref, _) {
              return TextButton(
                child: Text("取得"),
                onPressed: () async {
                  var list = await ref
                      .read(gameHistoryRepositoryProvider)
                      .getGameInfos();
                  list.forEach((element) {
                    debugPrint(element.gameId);
                  });
                },
              );
            })
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title; //masaki

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Consumer(builder: (context, ref, _) {
        return FloatingActionButton(
          onPressed: () async {},
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        );
      }), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
} //yokomichi
