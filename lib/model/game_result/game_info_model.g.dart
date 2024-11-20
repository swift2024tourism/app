// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameInfoModelImpl _$$GameInfoModelImplFromJson(Map<String, dynamic> json) =>
    _$GameInfoModelImpl(
      id: (json['id'] as num).toInt(),
      gameId: json['gameId'] as String,
      waypointId: json['waypointId'] as String,
      round: (json['round'] as num).toInt(),
      score: (json['score'] as num).toInt(),
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      distanceFromGoal: (json['distanceFromGoal'] as num).toDouble(),
    );

Map<String, dynamic> _$$GameInfoModelImplToJson(_$GameInfoModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'gameId': instance.gameId,
      'waypointId': instance.waypointId,
      'round': instance.round,
      'score': instance.score,
      'lat': instance.lat,
      'lon': instance.lon,
      'distanceFromGoal': instance.distanceFromGoal,
    };
