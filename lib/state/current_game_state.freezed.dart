// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'current_game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CurrentGameState {
  Difficulty get difficulty => throw _privateConstructorUsedError;
  GameModel? get currentGame => throw _privateConstructorUsedError;
  GeoPoint? get currentLocation => throw _privateConstructorUsedError;
  int get currentWaypointIndex => throw _privateConstructorUsedError;
  int get currentPictureIndex => throw _privateConstructorUsedError;
  GameResultModel? get gameResult => throw _privateConstructorUsedError;
  int get round => throw _privateConstructorUsedError;
  Map<int, GameInfoModel> get rounds => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CurrentGameStateCopyWith<CurrentGameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentGameStateCopyWith<$Res> {
  factory $CurrentGameStateCopyWith(
          CurrentGameState value, $Res Function(CurrentGameState) then) =
      _$CurrentGameStateCopyWithImpl<$Res, CurrentGameState>;
  @useResult
  $Res call(
      {Difficulty difficulty,
      GameModel? currentGame,
      GeoPoint? currentLocation,
      int currentWaypointIndex,
      int currentPictureIndex,
      GameResultModel? gameResult,
      int round,
      Map<int, GameInfoModel> rounds});

  $GameModelCopyWith<$Res>? get currentGame;
  $GameResultModelCopyWith<$Res>? get gameResult;
}

/// @nodoc
class _$CurrentGameStateCopyWithImpl<$Res, $Val extends CurrentGameState>
    implements $CurrentGameStateCopyWith<$Res> {
  _$CurrentGameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? difficulty = null,
    Object? currentGame = freezed,
    Object? currentLocation = freezed,
    Object? currentWaypointIndex = null,
    Object? currentPictureIndex = null,
    Object? gameResult = freezed,
    Object? round = null,
    Object? rounds = null,
  }) {
    return _then(_value.copyWith(
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as Difficulty,
      currentGame: freezed == currentGame
          ? _value.currentGame
          : currentGame // ignore: cast_nullable_to_non_nullable
              as GameModel?,
      currentLocation: freezed == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as GeoPoint?,
      currentWaypointIndex: null == currentWaypointIndex
          ? _value.currentWaypointIndex
          : currentWaypointIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentPictureIndex: null == currentPictureIndex
          ? _value.currentPictureIndex
          : currentPictureIndex // ignore: cast_nullable_to_non_nullable
              as int,
      gameResult: freezed == gameResult
          ? _value.gameResult
          : gameResult // ignore: cast_nullable_to_non_nullable
              as GameResultModel?,
      round: null == round
          ? _value.round
          : round // ignore: cast_nullable_to_non_nullable
              as int,
      rounds: null == rounds
          ? _value.rounds
          : rounds // ignore: cast_nullable_to_non_nullable
              as Map<int, GameInfoModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GameModelCopyWith<$Res>? get currentGame {
    if (_value.currentGame == null) {
      return null;
    }

    return $GameModelCopyWith<$Res>(_value.currentGame!, (value) {
      return _then(_value.copyWith(currentGame: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GameResultModelCopyWith<$Res>? get gameResult {
    if (_value.gameResult == null) {
      return null;
    }

    return $GameResultModelCopyWith<$Res>(_value.gameResult!, (value) {
      return _then(_value.copyWith(gameResult: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CurrentGameStateImplCopyWith<$Res>
    implements $CurrentGameStateCopyWith<$Res> {
  factory _$$CurrentGameStateImplCopyWith(_$CurrentGameStateImpl value,
          $Res Function(_$CurrentGameStateImpl) then) =
      __$$CurrentGameStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Difficulty difficulty,
      GameModel? currentGame,
      GeoPoint? currentLocation,
      int currentWaypointIndex,
      int currentPictureIndex,
      GameResultModel? gameResult,
      int round,
      Map<int, GameInfoModel> rounds});

  @override
  $GameModelCopyWith<$Res>? get currentGame;
  @override
  $GameResultModelCopyWith<$Res>? get gameResult;
}

/// @nodoc
class __$$CurrentGameStateImplCopyWithImpl<$Res>
    extends _$CurrentGameStateCopyWithImpl<$Res, _$CurrentGameStateImpl>
    implements _$$CurrentGameStateImplCopyWith<$Res> {
  __$$CurrentGameStateImplCopyWithImpl(_$CurrentGameStateImpl _value,
      $Res Function(_$CurrentGameStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? difficulty = null,
    Object? currentGame = freezed,
    Object? currentLocation = freezed,
    Object? currentWaypointIndex = null,
    Object? currentPictureIndex = null,
    Object? gameResult = freezed,
    Object? round = null,
    Object? rounds = null,
  }) {
    return _then(_$CurrentGameStateImpl(
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as Difficulty,
      currentGame: freezed == currentGame
          ? _value.currentGame
          : currentGame // ignore: cast_nullable_to_non_nullable
              as GameModel?,
      currentLocation: freezed == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as GeoPoint?,
      currentWaypointIndex: null == currentWaypointIndex
          ? _value.currentWaypointIndex
          : currentWaypointIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentPictureIndex: null == currentPictureIndex
          ? _value.currentPictureIndex
          : currentPictureIndex // ignore: cast_nullable_to_non_nullable
              as int,
      gameResult: freezed == gameResult
          ? _value.gameResult
          : gameResult // ignore: cast_nullable_to_non_nullable
              as GameResultModel?,
      round: null == round
          ? _value.round
          : round // ignore: cast_nullable_to_non_nullable
              as int,
      rounds: null == rounds
          ? _value._rounds
          : rounds // ignore: cast_nullable_to_non_nullable
              as Map<int, GameInfoModel>,
    ));
  }
}

/// @nodoc

class _$CurrentGameStateImpl extends _CurrentGameState {
  const _$CurrentGameStateImpl(
      {this.difficulty = Difficulty.easy,
      this.currentGame,
      this.currentLocation,
      this.currentWaypointIndex = 0,
      this.currentPictureIndex = 0,
      this.gameResult,
      this.round = 0,
      final Map<int, GameInfoModel> rounds = const {}})
      : assert(currentWaypointIndex >= 0),
        assert(currentPictureIndex >= 0),
        _rounds = rounds,
        super._();

  @override
  @JsonKey()
  final Difficulty difficulty;
  @override
  final GameModel? currentGame;
  @override
  final GeoPoint? currentLocation;
  @override
  @JsonKey()
  final int currentWaypointIndex;
  @override
  @JsonKey()
  final int currentPictureIndex;
  @override
  final GameResultModel? gameResult;
  @override
  @JsonKey()
  final int round;
  final Map<int, GameInfoModel> _rounds;
  @override
  @JsonKey()
  Map<int, GameInfoModel> get rounds {
    if (_rounds is EqualUnmodifiableMapView) return _rounds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rounds);
  }

  @override
  String toString() {
    return 'CurrentGameState(difficulty: $difficulty, currentGame: $currentGame, currentLocation: $currentLocation, currentWaypointIndex: $currentWaypointIndex, currentPictureIndex: $currentPictureIndex, gameResult: $gameResult, round: $round, rounds: $rounds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentGameStateImpl &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.currentGame, currentGame) ||
                other.currentGame == currentGame) &&
            (identical(other.currentLocation, currentLocation) ||
                other.currentLocation == currentLocation) &&
            (identical(other.currentWaypointIndex, currentWaypointIndex) ||
                other.currentWaypointIndex == currentWaypointIndex) &&
            (identical(other.currentPictureIndex, currentPictureIndex) ||
                other.currentPictureIndex == currentPictureIndex) &&
            (identical(other.gameResult, gameResult) ||
                other.gameResult == gameResult) &&
            (identical(other.round, round) || other.round == round) &&
            const DeepCollectionEquality().equals(other._rounds, _rounds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      difficulty,
      currentGame,
      currentLocation,
      currentWaypointIndex,
      currentPictureIndex,
      gameResult,
      round,
      const DeepCollectionEquality().hash(_rounds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentGameStateImplCopyWith<_$CurrentGameStateImpl> get copyWith =>
      __$$CurrentGameStateImplCopyWithImpl<_$CurrentGameStateImpl>(
          this, _$identity);
}

abstract class _CurrentGameState extends CurrentGameState {
  const factory _CurrentGameState(
      {final Difficulty difficulty,
      final GameModel? currentGame,
      final GeoPoint? currentLocation,
      final int currentWaypointIndex,
      final int currentPictureIndex,
      final GameResultModel? gameResult,
      final int round,
      final Map<int, GameInfoModel> rounds}) = _$CurrentGameStateImpl;
  const _CurrentGameState._() : super._();

  @override
  Difficulty get difficulty;
  @override
  GameModel? get currentGame;
  @override
  GeoPoint? get currentLocation;
  @override
  int get currentWaypointIndex;
  @override
  int get currentPictureIndex;
  @override
  GameResultModel? get gameResult;
  @override
  int get round;
  @override
  Map<int, GameInfoModel> get rounds;
  @override
  @JsonKey(ignore: true)
  _$$CurrentGameStateImplCopyWith<_$CurrentGameStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
