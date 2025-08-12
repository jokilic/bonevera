import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get_it/get_it.dart';

import '../../models/location/location.dart' as bonevera_location;
import '../../services/logger_service.dart';
import '../../util/dependencies.dart';
import '../../util/state.dart';
import '../main/locations_controller.dart';

class LocationSearchController extends ValueNotifier<BoneveraState<List<bonevera_location.Location>>> implements Disposable {
  ///
  /// CONSTRUCTOR
  ///

  final LoggerService logger;

  LocationSearchController({
    required this.logger,
  }) : super(Initial()) {
    textEditingController = TextEditingController();
  }

  ///
  /// VARIABLES
  ///

  late final TextEditingController textEditingController;

  ///
  /// DISPOSE
  ///

  @override
  void onDispose() {
    textEditingController.dispose();
  }

  ///
  /// METHODS
  ///

  /// Triggered when user presses location
  void locationPressed(bonevera_location.Location location) {
    /// Add new location to [Hive]
    final locationAdded = getIt.get<LocationsController>().addLocationToHive(passedLocation: location);

    /// Location successfully added, clear the [TextField] & update `state`
    if (locationAdded) {
      textEditingController.clear();

      value = Initial();

      /// Get `locations`
      final locations = getIt.get<LocationsController>().value.locations;

      /// If only one location, set it as `currentLocation`
      if (locations.length == 1) {
        getIt.get<LocationsController>().updateCurrentLocation(newCurrentLocation: location);
      }
    }
  }

  /// Triggered when the user searches for a `location`
  Future<void> onLocationSearch({required String address}) async {
    try {
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
          /// Generate `List<cjvnk_location.Location>` from `placemarks`
          final locations = placemarks
              .map(
                (placemark) => bonevera_location.Location(
                  name: placemark.name,
                  street: placemark.street,
                  isoCountryCode: placemark.isoCountryCode,
                  country: placemark.country,
                  postalCode: placemark.postalCode,
                  administrativeArea: placemark.administrativeArea,
                  subAdministrativeArea: placemark.subAdministrativeArea,
                  locality: placemark.locality,
                  subLocality: placemark.subLocality,
                  thoroughfare: placemark.thoroughfare,
                  subThoroughfare: placemark.subThoroughfare,
                  latitude: location.latitude,
                  longitude: location.longitude,
                ),
              )
              .toList();

          value = Success(
            data: locations,
          );
        }
        /// No [Placemarks] found
        else {
          value = Empty(
            text: 'No placemarks found',
          );
        }
      }
      /// No [Locations] found
      else {
        value = Empty(
          text: 'No locations found',
        );
      }
    } catch (e) {
      logger.e('LocationSearchController -> onLocationSearch() -> $e');
      value = Error(
        error: '$e',
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
