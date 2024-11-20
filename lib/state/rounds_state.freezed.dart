// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rounds_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RoundsState {
  Map<int, GameInfoModel> get rounds => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoundsStateCopyWith<RoundsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoundsStateCopyWith<$Res> {
  factory $RoundsStateCopyWith(
          RoundsState value, $Res Function(RoundsState) then) =
      _$RoundsStateCopyWithImpl<$Res, RoundsState>;
  @useResult
  $Res call({Map<int, GameInfoModel> rounds});
}

/// @nodoc
class _$RoundsStateCopyWithImpl<$Res, $Val extends RoundsState>
    implements $RoundsStateCopyWith<$Res> {
  _$RoundsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rounds = null,
  }) {
    return _then(_value.copyWith(
      rounds: null == rounds
          ? _value.rounds
          : rounds // ignore: cast_nullable_to_non_nullable
              as Map<int, GameInfoModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoundsStateImplCopyWith<$Res>
    implements $RoundsStateCopyWith<$Res> {
  factory _$$RoundsStateImplCopyWith(
          _$RoundsStateImpl value, $Res Function(_$RoundsStateImpl) then) =
      __$$RoundsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<int, GameInfoModel> rounds});
}

/// @nodoc
class __$$RoundsStateImplCopyWithImpl<$Res>
    extends _$RoundsStateCopyWithImpl<$Res, _$RoundsStateImpl>
    implements _$$RoundsStateImplCopyWith<$Res> {
  __$$RoundsStateImplCopyWithImpl(
      _$RoundsStateImpl _value, $Res Function(_$RoundsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rounds = null,
  }) {
    return _then(_$RoundsStateImpl(
      rounds: null == rounds
          ? _value._rounds
          : rounds // ignore: cast_nullable_to_non_nullable
              as Map<int, GameInfoModel>,
    ));
  }
}

/// @nodoc

class _$RoundsStateImpl implements _RoundsState {
  _$RoundsStateImpl({final Map<int, GameInfoModel> rounds = const {}})
      : _rounds = rounds;

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
    return 'RoundsState(rounds: $rounds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoundsStateImpl &&
            const DeepCollectionEquality().equals(other._rounds, _rounds));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rounds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoundsStateImplCopyWith<_$RoundsStateImpl> get copyWith =>
      __$$RoundsStateImplCopyWithImpl<_$RoundsStateImpl>(this, _$identity);
}

abstract class _RoundsState implements RoundsState {
  factory _RoundsState({final Map<int, GameInfoModel> rounds}) =
      _$RoundsStateImpl;

  @override
  Map<int, GameInfoModel> get rounds;
  @override
  @JsonKey(ignore: true)
  _$$RoundsStateImplCopyWith<_$RoundsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
