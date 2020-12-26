/// This library provides a core for implementing board games for on-device and
/// socket-io based servers, as well as client implementations.
///
/// A firebase based solution will be implemented in the future in another
/// flutter compatible package
library game_core;

export 'package:riverpod/riverpod.dart';
export 'core/errors.dart';
export 'core/game.dart';
export 'core/clients/clients.dart';
export 'core/game_state.dart';
