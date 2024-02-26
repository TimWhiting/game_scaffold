/// This library provides a core for implementing board games for on-device and
/// socket-io based servers, as well as client implementations.
///
/// A supabase based solution will be implemented in the future in another
/// flutter compatible package
library game_core;

export 'package:riverpod/riverpod.dart';

export 'core/backend.dart';
export 'core/client.dart' hide $kDebugMode;
export 'core/core.dart';
