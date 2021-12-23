/// Level
class Level implements Comparable<Level> {
  final String name;

  /// Unique value for this level. Used to order levels, so filtering can
  /// exclude messages whose level is under certain value.
  final int value;

  const Level(this.name, this.value);

  /// Special key to turn on logging for all levels ([value] = 0).
  static const Level ALL = Level('ALL', 0);

  /// Special key to turn off all logging ([value] = 2000).
  static const Level OFF = Level('OFF', 2000);

  /// Key for potential problems .
  static const Level WARNING = Level('WARNING', 100);

  /// Key for highly detailed tracing .
  static const Level DEBUG = Level('DEBUG', 200);

  /// Key for informational messages
  static const Level INFO = Level('INFO', 300);

  /// Key for error messages
  static const Level ERROR = Level('ERROR', 400);

  /// Key for serious error problems.
  static const Level SERIOUS = Level('SERIOUS', 500);

  @override
  bool operator ==(Object other) => other is Level && value == other.value;

  bool operator <(Level other) => value < other.value;

  bool operator <=(Level other) => value <= other.value;

  bool operator >(Level other) => value > other.value;

  bool operator >=(Level other) => value >= other.value;

  @override
  int compareTo(Level other) => value - other.value;

  @override
  int get hashCode => value;

  @override
  String toString() => name;
}
