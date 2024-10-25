import 'package:app/state/current_game_state.dart';
import 'package:app/view_model/current_game_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

const boldTextFontColor = Color.fromARGB(255, 68, 122, 156);

class GameResult extends StatelessWidget {
  const GameResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GameResultTop(),
          Expanded(child: GameResultMap()),
        ],
      ),
    );
  }
}

class GameResultMap extends ConsumerWidget {
  const GameResultMap({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(builder: (context, constraints) {
      debugPrint("constraints: $constraints");
      return ref.watch(currentGameViewModelProvider).maybeWhen(
          orElse: () => const CircularProgressIndicator(),
          data: (CurrentGameState data) {
            List<Marker> markers = [];
            // set goal
            markers.add(Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(data.currentGame!.waypoints[data.currentWaypointIndex].geopoint.latitude,
                    data.currentGame!.waypoints[data.currentWaypointIndex].geopoint.longitude),
                child: const Icon(Icons.location_on, color: Colors.red, size: 80.0)));
            // set current location
            markers.add(Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(data.currentLocation!.latitude, data.currentLocation!.longitude),
                child: const Icon(Icons.location_on, color: Colors.blue, size: 80.0)));
            return FlutterMap(
                options: MapOptions(
                  initialCenter: LatLng(
                      (data.currentLocation!.latitude + data.currentGame!.waypoints[data.currentWaypointIndex].geopoint.latitude) / 2,
                      (data.currentLocation!.longitude + data.currentGame!.waypoints[data.currentWaypointIndex].geopoint.longitude) / 2),
                  initialZoom: 15.5,
                  // 大きくなるほどズームが大きくなる 17.5
                ),
                children: [
                  TileLayer(
                    urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  ),
                  MarkerLayer(markers: markers)
                ]);
          });
    });
  }
}

class GameResultTop extends ConsumerWidget {
  const GameResultTop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(currentGameViewModelProvider).maybeWhen(
        orElse: () => const CircularProgressIndicator(),
        data: (CurrentGameState data) {
          return Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    data.gameResult!.score.toString(),
                    style: const TextStyle(fontSize: 70, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 68, 122, 156)),
                    //color: Color.fromARGB(1, 68, 122, 156)
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 17),
                    child: Text(
                      "/100",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          "撮影地から",
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 17),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Container(
                                  child: Transform.rotate(
                                    angle: data.gameResult!.directionFromCurrentLocation,
                                    child: Icon(
                                      Icons.arrow_back_outlined,
                                      size: 45,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "${data.gameResult!.meterDistanceFromAnswer.toString()}m",
                                style: TextStyle(fontSize: 40, color: boldTextFontColor, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ]);
        });
  }
}
