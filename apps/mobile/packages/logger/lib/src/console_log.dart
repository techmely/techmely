import 'package:logger/src/port/logger_port.dart';

class ConsoleLog implements LoggerPort {
  @override
  void error(String message,
      {Map<String, dynamic>? extra,
      String? timestamp,
      String? stacktrace}) {
    print("\x1B[31m [ERROR]:${DateTime.now()} $message \n"
        "stackTrace: $stacktrace \n"
        "extra: $extra \x1B[0m");
  }

  @override
  void info(String message, {Map<String, dynamic>? extra, String? timestamp}) {
    print("\x1B[36m [INFO]:${DateTime.now()} $message \x1B[0m");
  }

  @override
  void debug(String message, {Map<String, dynamic>? extra, String? timestamp}) {
    print("\x1B[32m [DEBUG]:${DateTime.now()} $message \x1B[0m");
  }

  @override
  void warning(String message,
      {Map<String, dynamic>? extra, String? timestamp, String? stacktrace}) {
    print("\x1B[33m [WARNING]:${DateTime.now()} $message \n"
        "stackTrace: $stacktrace \n"
        "extra: $extra \x1B[0m");
  }
}
