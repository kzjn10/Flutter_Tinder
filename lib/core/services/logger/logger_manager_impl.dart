import 'logger_manager.dart';

class LoggerManagerImpl extends ILoggerManager {
  static final ILoggerManager _instance = LoggerManagerImpl._internal();

  static ILoggerManager get self => _instance;

  factory LoggerManagerImpl() {
    return _instance;
  }

  LoggerManagerImpl._internal();

  @override
  void log(String tag, String msg) {
    print('${tag?.toUpperCase()}: $msg');
  }

  @override
  void logError(String tag, dynamic e) {
    print('${tag?.toUpperCase()}: ${e?.toString()}');
  }
}
