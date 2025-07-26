import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

import '../../models/location/location.dart';
import '../../services/hive_service.dart';
import '../../services/logger_service.dart';
import '../../util/dependencies.dart';
import '../weather/weather_screen.dart';
import 'main_controller.dart';

class MainScreen extends WatchingStatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();

    registerIfNotInitialized<MainController>(
      () => MainController(
        logger: getIt.get<LoggerService>(),
        hive: getIt.get<HiveService>(),
      ),
      instanceName: 'main',
    );
  }

  @override
  void dispose() {
    getIt.unregister<MainController>(
      instanceName: 'main',
    );

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mainState = watchIt<MainController>(
      instanceName: 'main',
    ).value;

    final location =
        mainState.firstOrNull ??
        Location(
          locality: 'Rab',
          country: 'Croatia',
          latitude: 44.7569,
          longitude: 14.7600,
        );

    return Scaffold(
      body: WeatherScreen(
        location: location,
        // key: ValueKey(location),
        key: const ValueKey('yo'),
      ),
    );
  }
}
