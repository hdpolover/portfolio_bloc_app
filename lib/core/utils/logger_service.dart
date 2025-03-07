import 'package:logger/logger.dart';

class LoggerService {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(),
  );

  static void logInfo(String message) {
    _logger.i(message);
  }

  static void logError(String message,
      [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  static void logWarning(String message) {
    _logger.w(message);
  }
}
