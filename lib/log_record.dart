import 'level.dart';

/// A log entry representation used to propagate information from [Logger] to
/// individual handlers.
class LogRecord {
  ///
  final Level level;

  ///
  final String message;

  /// Non-string message passed to Logger.
  final Object? object;

  /// Time when this record was created.
  final DateTime time;

  /// Associated stackTrace (if any) when recording errors messages.
  final StackTrace stackTrace;

  ///
  String path = '';

  ///
  int lineNumber = 0;

  LogRecord({
    required this.level,
    required this.message,
    required this.stackTrace,
    this.object,
  }) : time = DateTime.now() {
    final traceString = stackTrace.toString().split("\n")[2];
    final indexOfFileName =
        traceString.indexOf(RegExp(r'package:[A-Z/a-z_]+.dart'));
    if (indexOfFileName < 0) {
      return;
    }
    final fileInfo = traceString.substring(indexOfFileName);
    final listOfInfos = fileInfo.split(".dart:");
    path = listOfInfos[0] + ".dart";
    final lineInfo = listOfInfos[1].split(':');
    lineNumber = int.parse(lineInfo[0]);
  }

  @override
  String toString() => '[${level.name}] $message';
}
