import 'package:flutter_timezone/flutter_timezone.dart';

import 'logger_service.dart';

class TimezoneService {
  ///
  /// CONSTRUCTOR
  ///

  final LoggerService logger;

  TimezoneService({
    required this.logger,
  });

  ///
  /// METHODS
  ///

  /// Gets the device's current IANA timezone (e.g. `Europe/Zagreb`)
  Future<String> getDeviceTimezone() async {
    try {
      final timezone = await FlutterTimezone.getLocalTimezone();
      return timezone;
    }
    /// Fallback if it fails
    catch (e) {
      logger.e('getDeviceTimezone() -> $e');
      return 'UTC';
    }
  }
}
