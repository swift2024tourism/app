// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GameInfoModel _$GameInfoModelFromJson(Map<String, dynamic> json) {
  return _GameInfoModel.fromJson(json);
}

/// @nodoc
mixin _$GameInfoModel {
  int get id => throw _privateConstructorUsedError;
  String get gameId => throw _privateConstructorUsedError;
  String get waypointId => throw _privateConstructorUsedError;
  int get round => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get lon => throw _privateConstructorUsedError;
  double get distanceFromGoal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameInfoModelCopyWith<GameInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameInfoModelCopyWith<$Res> {
  factory $GameInfoModelCopyWith(
          GameInfoModel value, $Res Function(GameInfoModel) then) =
      _$GameInfoModelCopyWithImpl<$Res, GameInfoModel>;
  @useResult
  $Res call(
      {int id,
      String gameId,
      String waypointId,
      int round,
      int score,
      double lat,
      double lon,
      double distanceFromGoal});
}

/// @nodoc
class _$GameInfoModelCopyWithImpl<$Res, $Val extends GameInfoModel>
    implements $GameInfoModelCopyWith<$Res> {
  _$GameInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? gameId = null,
    Object? waypointId = null,
    Object? round = null,
    Object? score = null,
    Object? lat = null,
    Object? lon = null,
    Object? distanceFromGoal = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      gameId: null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as String,
      waypointId: null == waypointId
          ? _value.waypointId
          : waypointId // ignore: cast_nullable_to_non_nullable
              as String,
      round: null == round
          ? _value.round
          : round // ignore: cast_nullable_to_non_nullable
              as int,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
      distanceFromGoal: null == distanceFromGoal
          ? _value.distanceFromGoal
          : distanceFromGoal // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameInfoModelImplCopyWith<$Res>
    implements $GameInfoModelCopyWith<$Res> {
  factory _$$GameInfoModelImplCopyWith(
          _$GameInfoModelImpl value, $Res Function(_$GameInfoModelImpl) then) =
      __$$GameInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String gameId,
      String waypointId,
      int round,
      int score,
      double lat,
      double lon,
      double distanceFromGoal});
}

/// @nodoc
class __$$GameInfoModelImplCopyWithImpl<$Res>
    extends _$GameInfoModelCopyWithImpl<$Res, _$GameInfoModelImpl>
    implements _$$GameInfoModelImplCopyWith<$Res> {
  __$$GameInfoModelImplCopyWithImpl(
      _$GameInfoModelImpl _value, $Res Function(_$GameInfoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? gameId = null,
    Object? waypointId = null,
    Object? round = null,
    Object? score = null,
    Object? lat = null,
    Object? lon = null,
    Object? distanceFromGoal = null,
  }) {
    return _then(_$GameInfoModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      gameId: null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as String,
      waypointId: null == waypointId
          ? _value.waypointId
          : waypointId // ignore: cast_nullable_to_non_nullable
              as String,
      round: null == round
          ? _value.round
          : round // ignore: cast_nullable_to_non_nullable
              as int,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
      distanceFromGoal: null == distanceFromGoal
          ? _value.distanceFromGoal
          : distanceFromGoal // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameInfoModelImpl implements _GameInfoModel {
  const _$GameInfoModelImpl(
      {required this.id,
      required this.gameId,
      required this.waypointId,
      required this.round,
      required this.score,
      required this.lat,
      required this.lon,
      required this.distanceFromGoal});

  factory _$GameInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameInfoModelImplFromJson(json);

  @override
  final int id;
  @override
  final String gameId;
  @override
  final String waypointId;
  @override
  final int round;
  @override
  final int score;
  @override
  final double lat;
  @override
  final double lon;
  @override
  final double distanceFromGoal;

  @override
  String toString() {
    return 'GameInfoModel(id: $id, gameId: $gameId, waypointId: $waypointId, round: $round, score: $score, lat: $lat, lon: $lon, distanceFromGoal: $distanceFromGoal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameInfoModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.gameId, gameId) || other.gameId == gameId) &&
            (identical(other.waypointId, waypointId) ||
                other.waypointId == waypointId) &&
            (identical(other.round, round) || other.round == round) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.distanceFromGoal, distanceFromGoal) ||
                other.distanceFromGoal == distanceFromGoal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, gameId, waypointId, round,
      score, lat, lon, distanceFromGoal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameInfoModelImplCopyWith<_$GameInfoModelImpl> get copyWith =>
      __$$GameInfoModelImplCopyWithImpl<_$GameInfoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameInfoModelImplToJson(
      this,
    );
  }
}

abstract class _GameInfoModel implements GameInfoModel {
  const factory _GameInfoModel(
      {required final int id,
      required final String gameId,
      required final String waypointId,
      required final int round,
      required final int score,
      required final double lat,
      required final double lon,
      required final double distanceFromGoal}) = _$GameInfoModelImpl;

  factory _GameInfoModel.fromJson(Map<String, dynamic> json) =
      _$GameInfoModelImpl.fromJson;

  @override
  int get id;
  @override
  String get gameId;
  @override
  String get waypointId;
  @override
  int get round;
  @override
  int get score;
  @override
  double get lat;
  @override
  double get lon;
  @override
  double get distanceFromGoal;
  @override
  @JsonKey(ignore: true)
  _$$GameInfoModelImplCopyWith<_$GameInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
