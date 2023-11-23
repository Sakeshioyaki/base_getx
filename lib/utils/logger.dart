import 'package:logger/logger.dart';

MyLogger logger = MyLogger();

class MyLogger {
  Logger logger = Logger();

  /// Log a message at level verbose.
  void v(dynamic message) {
    logger.v("🤍 VERBOSE: $message");
  }

  /// Log a message at level debug.
  void d(dynamic message) {
    logger.d("💙 DEBUG: $message");
    //print(StackTrace.current.toString());
  }

  /// Log a message at level info.
  void i(dynamic message) {
    logger.i("💚️ INFO: $message");
  }

  /// Log a message at level warning.
  void w(dynamic message) {
    logger.w("💛 WARNING: $message");
  }

  /// Log a message at level error.
  void e(dynamic message) {
    logger.e("❤️ ERROR: $message");
    print(StackTrace.current.toString());
  }
}
