import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../core.dart';
part 'reversi.freezed.dart';
part 'reversi.g.dart';

@freezed
abstract class ReversiGame with _$ReversiGame implements Game {
  const factory ReversiGame() = _ReversiGame;
  factory ReversiGame.fromJson(Map<String, dynamic> map) =>
      _$ReversiGameFromJson(map);
}
