class UiConstants {
  /// Base viewport size where things are scaled up from
  static const double BASE_VIEWPORT_SIZE = 375;

  /// Max viewport width for mobile
  static const double MAX_MOBILE_VIEWPORT_SIZE = 414;

  /// Max supported viewport width
  static const double MAX_VIEWPORT_SIZE = 480;

  /// Max scale for all viewports <= 480
  ///
  /// Currently, scale everything up to 375
  static const double MAX_SCALE = 1.15;

  /// Max scale for viewports > 480 (i.e. Tablets)
  static const double TABLET_MAX_SCALE = 1.2;
}

enum ActionType { PROFILE, CALENDAR, ADDRESS, PHONE, LOCK }
