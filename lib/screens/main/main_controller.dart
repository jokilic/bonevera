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

  /// Triggered when user deletes locations
  void deleteLocation(cjvnk_location.Location location) {
    /// Generate new `state`
    final newLocations = List<cjvnk_location.Location>.from(value.locations)..remove(location);

    /// Update all locations in [Hive]
    hive.writeLocationList(newLocations: newLocations);

    /// Update `state`
    value = (
      locations: newLocations,
      currentLocation: value.currentLocation,
    );
  }

  /// Triggered when user reorders locations
  void reorderLocations(int oldIndex, int newIndex) {
    /// Modify `state`
    final item = value.locations.removeAt(oldIndex);

    /// Generate new `state`
    final newLocations = List<cjvnk_location.Location>.from(value.locations)..insert(newIndex, item);

    /// Update all locations in [Hive]
    hive.writeLocationList(newLocations: newLocations);

    /// Update `state`
    value = (
      locations: newLocations,
      currentLocation: value.currentLocation,
    );
  }

  /// Adds `location` to [Hive]
  bool addLocationToHive({required cjvnk_location.Location passedLocation}) {
    /// Check if `location` already exists
    final locationExists = value.locations.any(
      (location) => location.latitude == passedLocation.latitude && location.longitude == passedLocation.longitude,
    );

    /// `location` doesn't exist, write in [Hive] and update `state`
    if (!locationExists) {
      /// Generate new `state`
      final newLocations = hive.getLocations()..add(passedLocation);

      /// Add new location in [Hive]
      hive.writeLocation(newLocation: passedLocation);

      /// Update `state`
      value = (
        locations: newLocations,
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
