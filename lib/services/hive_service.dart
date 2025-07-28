import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../hive_registrar.g.dart';
import '../models/location/location.dart';
import '../models/token/token.dart';
import '../util/path.dart';
import 'logger_service.dart';

class HiveService implements Disposable {
  final LoggerService logger;

  HiveService({
    required this.logger,
  });

  ///
  /// VARIABLES
  ///

  late final Box<Token> tokens;
  late final Box<Location> locations;

  ///
  /// INIT
  ///

  Future<void> init() async {
    final directory = await getHiveDirectory();

    Hive
      ..init(directory?.path)
      ..registerAdapters();

    tokens = await Hive.openBox<Token>('tokensBox');
    locations = await Hive.openBox<Location>('locationsBox');
  }

  ///
  /// DISPOSE
  ///

  @override
  Future<void> onDispose() async {
    await tokens.close();
    await locations.close();
    await Hive.close();
  }

  ///
  /// METHODS
  ///

  /// Called to get `token` from [Hive]
  Token? getToken() => tokens.get(0);

  /// Stores a new `token` in [Hive]
  Future<void> writeToken({required Token newToken}) async => tokens.put(0, newToken);

  /// Called to get `locations` from [Hive]
  List<Location> getLocations() => locations.values.toList();

  /// Stores a new `location` in [Hive]
  Future<void> writeLocation({required Location newLocation}) async => locations.add(newLocation);

  /// Clears old values & stores a new `List<Location>` in [Hive]
  Future<void> writeLocationList({required List<Location> newLocations}) async {
    await locations.clear();
    await locations.addAll(newLocations);
  }
}
