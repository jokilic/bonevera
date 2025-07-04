import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

import '../constants/enums.dart';
import '../services/api_service.dart';
import '../services/location_service.dart';
import '../services/permission_service.dart';
import '../services/timezone_service.dart';
import '../services/token_service.dart';
import '../util/dependencies.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    final permissionStatus = await getIt.get<PermissionService>().handleLocationPermission();

    if (permissionStatus) {
      final location = await getIt.get<LocationService>().getDeviceLocation();

      if (location != null) {
        final token = await getIt.get<TokenService>().getToken();

        final timezone = await getIt.get<TimezoneService>().getDeviceTimezone();

        if (token != null) {
          await getIt.get<APIService>().getWeather(
            language: 'hr',
            countryCode: 'hr',
            coordinates: LatLng(
              location.latitude,
              location.longitude,
            ),
            timezone: timezone,
            tokenValue: token.value,
            dataSets: [
              DataSet.currentWeather,
            ],
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) => const Scaffold();
}
