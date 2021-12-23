## 为什么会有这个库？
在日常开发过程中，日志是我们找虫子，最方便的线索。但是，Flutter自带的打印日志，没有打印时间、文件名和行号。这对我们快速找问题，带来了不便。传送门[via_logger](https://pub.dev/packages/via_logger)

## 特性

- [x] 打印日志级别、时间、文件路径和行号
- [x] 打印长日志
- [x] 根据日志级别过滤日志
- [x] 自定义打印内容

## 如何使用？

### 1. 简单使用

引入包，就可以直接使用，所见即所得。

```
Logger.info('this is info log.');

打印出来就是：
2021-12-23 15:07:51.066223 [package:/test/main.dart:123] this is info log.
```

### 2. 设置日志级别
在debug模式下，默认是打印所有的日志，在product模式下，默认关闭了所有日志。

```
///设置日志级别为info，则只会显示INFO以上的级别的日志。
Logger.minLevel = Level.INFO;
```

### 3.自定义日志输出
#### a. 创建继承Output的子类，重写output方法

```
class Console extends Output {
  @override
  void output(LogRecord record) {
    ///自定义打印样式
    print('${record.time [${record.path}:${record.lineNumber}] ${record.message}');
  }
}
```

#### b. 设置输出引擎
在app的初始化的时候，设置输出引擎

```
final List<Output> engines = [Console()];
Logger.setEngines(engines);
```
