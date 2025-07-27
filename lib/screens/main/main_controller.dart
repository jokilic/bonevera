import 'package:flutter/foundation.dart';

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

  void addLocationToHive({required cjvnk_location.Location location}) {
    hive.writeLocation(newLocation: location);
  }
}
