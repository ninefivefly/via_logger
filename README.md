
# via_logger
Language: English| [中文简体](https://github.com/ninefivefly/via_logger/blob/master/README_zh.md)

## Why was this library created?
In the daily development process, the log is the most convenient clue for us to find bugs. However, the print log that comes with Flutter does not print the time, file name, and line number. This caused us inconvenience to find the problem quickly. Portal [via_logger](https://pub.dev/packages/via_logger)

## Features

-[x] Print log level, time, file path and line number
-[x] Print long log
-[x] Filter logs based on log level
-[x] Custom print content

## Install

```
dependencies:
  via_logger:
```

## how to use?

### 1. Simple to use

Import the package, you can use it directly, what you see is what you get.

```
import 'package:via_logger/via_logger.dart';

Logger.info('this is info log.');

Printed out is:
2021-12-23 15:07:51.066223 [package:/test/main.dart:123] this is info log.
```

### 2. Set the log level
In debug mode, all logs are printed by default; in product mode, all logs are closed by default.

```
///If the log level is set to info, only logs with a level above INFO will be displayed.
Logger.minLevel = Level.INFO;
```

### 3. Custom log output
#### a. Create a subclass that inherits Output and override the output method

```
class Console extends Output {
  @override
  void output(LogRecord record) {
    ///Custom print style
    print('${record.time [${record.path}:${record.lineNumber}] ${record.message}');
  }
}
```

#### b. Set output engine
When the app is initialized, set the output engine.

```
final List<Output> engines = [Console()];
Logger.setEngines(engines);
```

