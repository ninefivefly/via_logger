import 'package:flutter/foundation.dart';

import 'level.dart';
import 'log_record.dart';
import 'output.dart';
import 'output_console.dart';

class Logger {
  ///logger engine
  static final _root = _Logger();

  Logger._();

  ///
  static void debug(Object? message) => _root.log(Level.DEBUG, message);

  ///
  static void warning(Object? message) => _root.log(Level.WARNING, message);

  ///
  static void info(Object? message) => _root.log(Level.INFO, message);

  ///
  static void error(Object? message) => _root.log(Level.ERROR, message);

  ///
  static void serious(Object? message) => _root.log(Level.SERIOUS, message);

  /// set the log level.
  static set minLevel(Level minLevel) {
    _root.min = minLevel;
  }

  /// custom log engines.
  static void setEngines(List<Output> engines) {
    _root.engines = engines;
  }
}

class _Logger {
  late Level min;
  late List<Output> engines;

  _Logger() {
    min = kDebugMode ? Level.ALL : Level.OFF;
    engines = [Console()];
  }

  ///
  void log(Level level, Object? message) {
    if (level < min) {
      return;
    }

    final lr = LogRecord(
      level: level,
      message: message is String ? message : message.toString(),
      stackTrace: StackTrace.current,
    );

    for (var element in engines) {
      element.output(lr);
    }
  }
}
