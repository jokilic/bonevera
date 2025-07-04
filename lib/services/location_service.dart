import 'package:geolocator/geolocator.dart';

import 'logger_service.dart';

class LocationService {
  ///
  /// CONSTRUCTOR
  ///

  final LoggerService logger;

  LocationService({
    required this.logger,
  });

  ///
  /// METHODS
  ///

  /// Gets the device's location
  Future<Position?> getDeviceLocation() async {
    try {
      /// Get current location
      final currentLocation = await getDeviceCurrentLocation();

      /// Current location fetched, return it
      if (currentLocation != null) {
        return currentLocation;
      }

      /// Get last known location
      final lastKnownLocation = await getDeviceLastKnownLocation();

      /// Last known location fetched, return it
      if (lastKnownLocation != null) {
        return lastKnownLocation;
      }

      /// No location fetched, return `null`
      return null;
    } catch (e) {
      logger.e('LocationService -> getDeviceLocation() -> $e');
      return null;
    }
  }

  /// Gets the device's current location
  Future<Position?> getDeviceCurrentLocation() async {
    try {
      const locationSettings = LocationSettings(
        accuracy: LocationAccuracy.low,
        distanceFilter: 100,
      );

      final position = await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );

      return position;
    } catch (e) {
      logger.e('LocationService -> getDeviceCurrentLocation() -> $e');
      return null;
    }
  }

  /// Gets the device's last known location
  Future<Position?> getDeviceLastKnownLocation() async {
    try {
      final position = await Geolocator.getLastKnownPosition();
      return position;
    } catch (e) {
      logger.e('LocationService -> getDeviceLastKnownLocation() -> $e');
      return null;
    }
  }
}
