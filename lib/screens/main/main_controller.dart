import 'package:flutter/foundation.dart';

import '../../models/location/location.dart' as cjvnk_location;
import '../../services/hive_service.dart';
import '../../services/logger_service.dart';

class MainController extends ValueNotifier<({List<cjvnk_location.Location> locations, cjvnk_location.Location? currentLocation})> {
  ///
  /// CONSTRUCTOR
  ///

  final LoggerService logger;
  final HiveService hive;

  MainController({
    required this.logger,
    required this.hive,
  }) : super((
         locations: hive.getLocations(),
         currentLocation: hive.getLocations().firstOrNull,
       ));

  ///
  /// METHODS
  ///

  /// Adds `location` to [Hive]
  bool addLocationToHive({required cjvnk_location.Location passedLocation}) {
    /// Check if `location` already exists
    final locationExists = value.locations.any(
      (location) => location.latitude == passedLocation.latitude && location.longitude == passedLocation.longitude,
    );

    /// `location` doesn't exist, write in [Hive] and update `state`
    if (!locationExists) {
      hive.writeLocation(newLocation: passedLocation);

      value = (
        locations: hive.getLocations(),
        currentLocation: value.currentLocation,
      );

      return true;
    }

    return false;
  }

  /// Updates `state` with new `currentLocation`
  void updateCurrentLocation({required cjvnk_location.Location newCurrentLocation}) => value = (
    locations: value.locations,
    currentLocation: newCurrentLocation,
  );
}
