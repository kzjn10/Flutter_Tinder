abstract class ILoggerManager {
  void log(String tag, String msg);
  void logError(String tag, dynamic e);
}
