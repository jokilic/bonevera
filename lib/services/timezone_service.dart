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
  /// VARIABLES
  ///

  late String timezone;

  ///
  /// METHODS
  ///

  /// Gets the device's current IANA timezone (e.g. `Europe/Zagreb`)
  Future<String> getDeviceTimezone() async {
    try {
      return timezone = await FlutterTimezone.getLocalTimezone();
    }
    /// Fallback if it fails
    catch (e) {
      logger.e('TimezoneService -> getDeviceTimezone() -> $e');
      return timezone = 'UTC';
    }
  }
}
