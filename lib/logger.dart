import 'level.dart';
import 'log_record.dart';
import 'output.dart';
import 'output_console.dart';

class Logger {
  ///logger engine
  static final _root = _Logger();

  Logger._();

  ///
  static void warning(Object? message) => _root.log(Level.WARNING, message);

  ///
  static void debug(Object? message) => _root.log(Level.DEBUG, message);

  ///
  static void info(Object? message) => _root.log(Level.INFO, message);

  ///
  static void error(Object? message) => _root.log(Level.ERROR, message);

  ///
  static void serious(Object? message) => _root.log(Level.SERIOUS, message);

  ///
  static set minLevel(Level minLevel) {
    _root.min = minLevel;
  }

  static void addEngine(Output engine) {
    _root.engines.add(engine);
  }
}

class _Logger {
  Level min = Level.ALL;
  List<Output> engines = [Console()];

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

    engines.forEach((element) {
      element.output(lr);
    });
  }
}
