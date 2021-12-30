import 'package:via_logger/logger.dart';

void main() {
  Logger.debug('this is debug log.');
  Logger.warning('this is warning log.');
  Logger.info('this is info log.');
  Logger.error('this is error log.');
  Logger.serious('this is serious error log.');

  /*
  * 2021-12-23 15:07:51.066223 [package:/test/main.dart:4] this is debug log.
  * 2021-12-23 15:07:51.066223 [package:/test/main.dart:5] this is warning log.
  * 2021-12-23 15:07:51.066223 [package:/test/main.dart:6] this is info log.
  * 2021-12-23 15:07:51.066223 [package:/test/main.dart:7] this is error log.
  * 2021-12-23 15:07:51.066223 [package:/test/main.dart:8] this is serious error log.
  * */
}

