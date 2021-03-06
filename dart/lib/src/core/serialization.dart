import 'package:json_annotation/json_annotation.dart';

import 'core.dart';

class BasicConverter<T> implements JsonConverter<dynamic, T> {
  const BasicConverter(
      {T Function(dynamic) fromJson, dynamic Function(T) toJson})
      : _fromJson = fromJson,
        _toJson = toJson;
  final T Function(dynamic) _fromJson;
  final T Function(dynamic) _toJson;
  @override
  dynamic fromJson(T json) => _fromJson(json);

  @override
  T toJson(dynamic object) => _toJson(object);
}

class DefaultConverter implements JsonConverter {
  const DefaultConverter();
  @override
  dynamic fromJson(json) => json;

  @override
  dynamic toJson(object) => object;
}

class UnmodifiableList<T> implements JsonConverter<List<T>, List> {
  const UnmodifiableList();
  final JsonConverter elementConverter = const DefaultConverter();
  @override
  List<T> fromJson(List json) =>
      json.map(elementConverter.fromJson).cast<T>().toUnmodifiable();

  @override
  List toJson(List<T> object) => object.map(elementConverter.toJson).toList();
}

class UnmodifiableListList<T> implements JsonConverter<List<List<T>>, List> {
  const UnmodifiableListList();
  final JsonConverter elementConverter = const DefaultConverter();

  @override
  List<List<T>> fromJson(List json) => json
      .cast<List>()
      .map((j) => j.map(elementConverter.fromJson).cast<T>().toUnmodifiable())
      .toUnmodifiable();

  @override
  List toJson(List<List<T>> object) =>
      object.map((l) => l.map(elementConverter.toJson).toList()).toList();
}

class UnmodifiablePlayerList extends UnmodifiableList<Player> {
  @override
  JsonConverter get elementConverter => BasicConverter(
      toJson: (p) => p.toJson(), fromJson: (p) => Player.fromJson(p));
  const UnmodifiablePlayerList();
}

class UnmodifiableStringList extends UnmodifiableList<String> {
  const UnmodifiableStringList();
}

class UnmodifiableGameMessageList extends UnmodifiableList<GameMessage> {
  @override
  JsonConverter get elementConverter => BasicConverter(
      toJson: (gm) => gm.toJson(), fromJson: (gm) => GameMessage.fromJson(gm));
  const UnmodifiableGameMessageList();
}

class UnmodifiableDoubleListList extends UnmodifiableListList<double> {
  const UnmodifiableDoubleListList();
}

const unmodifiablePlayerList = UnmodifiablePlayerList();
const unmodifiableStringList = UnmodifiableStringList();
const unmodifiableGameMessageList = UnmodifiableGameMessageList();
const unmodifiableDoubleListList = UnmodifiableDoubleListList();
