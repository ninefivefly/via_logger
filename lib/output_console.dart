import 'log_record.dart';
import 'output.dart';
import 'dart:developer' as developer;

class Console extends Output {
  @override
  void output(LogRecord record) {
    developer.log(
        '${record.time} [${record.path}:${record.lineNumber}] ${record.message}',
        name: record.level.name);
  }
}
