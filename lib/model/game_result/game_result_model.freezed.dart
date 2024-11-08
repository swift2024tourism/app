// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GameResultModel {
  int get score => throw _privateConstructorUsedError;
  int get maxScore => throw _privateConstructorUsedError;
  int get meterDistanceFromAnswer => throw _privateConstructorUsedError;
  double get directionFromCurrentLocation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameResultModelCopyWith<GameResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameResultModelCopyWith<$Res> {
  factory $GameResultModelCopyWith(
          GameResultModel value, $Res Function(GameResultModel) then) =
      _$GameResultModelCopyWithImpl<$Res, GameResultModel>;
  @useResult
  $Res call(
      {int score,
      int maxScore,
      int meterDistanceFromAnswer,
      double directionFromCurrentLocation});
}

/// @nodoc
class _$GameResultModelCopyWithImpl<$Res, $Val extends GameResultModel>
    implements $GameResultModelCopyWith<$Res> {
  _$GameResultModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = null,
    Object? maxScore = null,
    Object? meterDistanceFromAnswer = null,
    Object? directionFromCurrentLocation = null,
  }) {
    return _then(_value.copyWith(
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      maxScore: null == maxScore
          ? _value.maxScore
          : maxScore // ignore: cast_nullable_to_non_nullable
              as int,
      meterDistanceFromAnswer: null == meterDistanceFromAnswer
          ? _value.meterDistanceFromAnswer
          : meterDistanceFromAnswer // ignore: cast_nullable_to_non_nullable
              as int,
      directionFromCurrentLocation: null == directionFromCurrentLocation
          ? _value.directionFromCurrentLocation
          : directionFromCurrentLocation // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameResultModelImplCopyWith<$Res>
    implements $GameResultModelCopyWith<$Res> {
  factory _$$GameResultModelImplCopyWith(_$GameResultModelImpl value,
          $Res Function(_$GameResultModelImpl) then) =
      __$$GameResultModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int score,
      int maxScore,
      int meterDistanceFromAnswer,
      double directionFromCurrentLocation});
}

/// @nodoc
class __$$GameResultModelImplCopyWithImpl<$Res>
    extends _$GameResultModelCopyWithImpl<$Res, _$GameResultModelImpl>
    implements _$$GameResultModelImplCopyWith<$Res> {
  __$$GameResultModelImplCopyWithImpl(
      _$GameResultModelImpl _value, $Res Function(_$GameResultModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = null,
    Object? maxScore = null,
    Object? meterDistanceFromAnswer = null,
    Object? directionFromCurrentLocation = null,
  }) {
    return _then(_$GameResultModelImpl(
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      maxScore: null == maxScore
          ? _value.maxScore
          : maxScore // ignore: cast_nullable_to_non_nullable
              as int,
      meterDistanceFromAnswer: null == meterDistanceFromAnswer
          ? _value.meterDistanceFromAnswer
          : meterDistanceFromAnswer // ignore: cast_nullable_to_non_nullable
              as int,
      directionFromCurrentLocation: null == directionFromCurrentLocation
          ? _value.directionFromCurrentLocation
          : directionFromCurrentLocation // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$GameResultModelImpl implements _GameResultModel {
  const _$GameResultModelImpl(
      {required this.score,
      this.maxScore = 100,
      required this.meterDistanceFromAnswer,
      required this.directionFromCurrentLocation});

  @override
  final int score;
  @override
  @JsonKey()
  final int maxScore;
  @override
  final int meterDistanceFromAnswer;
  @override
  final double directionFromCurrentLocation;

  @override
  String toString() {
    return 'GameResultModel(score: $score, maxScore: $maxScore, meterDistanceFromAnswer: $meterDistanceFromAnswer, directionFromCurrentLocation: $directionFromCurrentLocation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameResultModelImpl &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.maxScore, maxScore) ||
                other.maxScore == maxScore) &&
            (identical(
                    other.meterDistanceFromAnswer, meterDistanceFromAnswer) ||
                other.meterDistanceFromAnswer == meterDistanceFromAnswer) &&
            (identical(other.directionFromCurrentLocation,
                    directionFromCurrentLocation) ||
                other.directionFromCurrentLocation ==
                    directionFromCurrentLocation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, score, maxScore,
      meterDistanceFromAnswer, directionFromCurrentLocation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameResultModelImplCopyWith<_$GameResultModelImpl> get copyWith =>
      __$$GameResultModelImplCopyWithImpl<_$GameResultModelImpl>(
          this, _$identity);
}

abstract class _GameResultModel implements GameResultModel {
  const factory _GameResultModel(
          {required final int score,
          final int maxScore,
          required final int meterDistanceFromAnswer,
          required final double directionFromCurrentLocation}) =
      _$GameResultModelImpl;

  @override
  int get score;
  @override
  int get maxScore;
  @override
  int get meterDistanceFromAnswer;
  @override
  double get directionFromCurrentLocation;
  @override
  @JsonKey(ignore: true)
  _$$GameResultModelImplCopyWith<_$GameResultModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
