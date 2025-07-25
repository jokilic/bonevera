import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';

import '../../models/location/location.dart' as cjvnk_location;
import '../../services/hive_service.dart';
import '../../services/logger_service.dart';

class MainController extends ValueNotifier<List<cjvnk_location.Location>> {
  ///
  /// CONSTRUCTOR
  ///

  final LoggerService logger;
  final HiveService hive;

  MainController({
    required this.logger,
    required this.hive,
  }) : super(hive.getLocations());

  ///
  /// METHODS
  ///

  /// Fetches [List<Location>] from passed `address`
  Future<Location> getLocationFromAddress({required String address}) async {
    final locations = await locationFromAddress(address.trim());
    logger.f(locations.toString());
    return locations.first;
  }

  /// Fetches [List<Placemark>] from passed `latitude` & `longitude`
  Future<void> getAddressFromLocation({
    required double latitude,
    required double longitude,
  }) async {
    final placemarks = await placemarkFromCoordinates(latitude, longitude);
    logger.f(placemarks.toString());
  }
}
