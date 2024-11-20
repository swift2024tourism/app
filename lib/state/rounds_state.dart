import 'package:app/model/game_result/game_info_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rounds_state.freezed.dart';

@freezed
class RoundsState with _$RoundsState {
  factory RoundsState({
    @Default({}) Map<int, GameInfoModel> rounds,
  }) = _RoundsState;
}
