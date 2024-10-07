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
  GameModel? get currentGame => throw _privateConstructorUsedError;

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
  $Res call({GameModel? currentGame});

  $GameModelCopyWith<$Res>? get currentGame;
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
    Object? currentGame = freezed,
  }) {
    return _then(_value.copyWith(
      currentGame: freezed == currentGame
          ? _value.currentGame
          : currentGame // ignore: cast_nullable_to_non_nullable
              as GameModel?,
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
}

/// @nodoc
abstract class _$$CurrentGameStateImplCopyWith<$Res>
    implements $CurrentGameStateCopyWith<$Res> {
  factory _$$CurrentGameStateImplCopyWith(_$CurrentGameStateImpl value,
          $Res Function(_$CurrentGameStateImpl) then) =
      __$$CurrentGameStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GameModel? currentGame});

  @override
  $GameModelCopyWith<$Res>? get currentGame;
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
    Object? currentGame = freezed,
  }) {
    return _then(_$CurrentGameStateImpl(
      currentGame: freezed == currentGame
          ? _value.currentGame
          : currentGame // ignore: cast_nullable_to_non_nullable
              as GameModel?,
    ));
  }
}

/// @nodoc

class _$CurrentGameStateImpl implements _CurrentGameState {
  const _$CurrentGameStateImpl({this.currentGame});

  @override
  final GameModel? currentGame;

  @override
  String toString() {
    return 'CurrentGameState(currentGame: $currentGame)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentGameStateImpl &&
            (identical(other.currentGame, currentGame) ||
                other.currentGame == currentGame));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentGame);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentGameStateImplCopyWith<_$CurrentGameStateImpl> get copyWith =>
      __$$CurrentGameStateImplCopyWithImpl<_$CurrentGameStateImpl>(
          this, _$identity);
}

abstract class _CurrentGameState implements CurrentGameState {
  const factory _CurrentGameState({final GameModel? currentGame}) =
      _$CurrentGameStateImpl;

  @override
  GameModel? get currentGame;
  @override
  @JsonKey(ignore: true)
  _$$CurrentGameStateImplCopyWith<_$CurrentGameStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}