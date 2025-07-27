import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';

import '../../services/logger_service.dart';
import '../../util/state.dart';

class LocationsController extends ValueNotifier<CJVnkState<List<Placemark>>> {
  ///
  /// CONSTRUCTOR
  ///

  final LoggerService logger;

  LocationsController({
    required this.logger,
  }) : super(Initial());

  ///
  /// METHODS
  ///

  /// Triggered when the user searches for a `location`
  Future<void> onLocationSearch({required String address}) async {
    value = Loading();

    final locations = await getLocationsFromAddress(address: address);

    /// At least one [Location] is found
    if (locations.isNotEmpty) {
      final location = locations.first;

      final placemarks = await getAddressesFromLocation(
        latitude: location.latitude,
        longitude: location.longitude,
      );

      /// At least one [Placemark] is found
      if (placemarks.isNotEmpty) {
        value = Success(
          data: placemarks,
        );
      }
      /// No [Placemarks] found
      else {
        value = Error(
          error: 'No placemarks found',
        );
      }
    }
    /// No [Locations] found
    else {
      value = Error(
        error: 'No locations found',
      );
    }
  }

  /// Fetches [List<Location>] from passed `address`
  Future<List<Location>> getLocationsFromAddress({required String address}) async {
    final locations = await locationFromAddress(address);
    return locations;
  }

  /// Fetches [List<Placemark>] from passed `latitude` & `longitude`
  Future<List<Placemark>> getAddressesFromLocation({
    required double latitude,
    required double longitude,
  }) async {
    final placemarks = await placemarkFromCoordinates(latitude, longitude);
    return placemarks;
  }
}
