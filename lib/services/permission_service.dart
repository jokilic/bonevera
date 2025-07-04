import 'package:permission_handler/permission_handler.dart';

import 'logger_service.dart';

class PermissionService {
  ///
  /// CONSTRUCTOR
  ///

  final LoggerService logger;

  PermissionService({
    required this.logger,
  });

  ///
  /// METHODS
  ///

  /// Checks and requests user permission, returns `boolean` status
  Future<bool> handleLocationPermission() async {
    try {
      final status = await Permission.location.status;

      /// Location permission is granted
      if (status.isGranted) {
        return true;
      }

      /// Ask for location permission
      if (status.isDenied || status.isLimited || status.isProvisional || status.isRestricted) {
        final requestPermissionStatus = await Permission.location.request();

        /// Return new permission `status`
        return requestPermissionStatus.isGranted;
      }

      /// Location permission not granted
      return false;
    } catch (e) {
      logger.e('PermissionService -> handleLocationPermission() -> $e');
      return false;
    }
  }
}
