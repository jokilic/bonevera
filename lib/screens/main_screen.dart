import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

import '../constants/enums.dart';
import '../services/api_service.dart';
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

    () async {
      final token = await getIt.get<TokenService>().getToken();

      final timezone = await getIt.get<TimezoneService>().getDeviceTimezone();

      if (token != null) {
        await getIt.get<APIService>().getWeather(
          language: 'hr',
          countryCode: 'hr',
          coordinates: const LatLng(34.0549, 118.2426),
          timezone: timezone,
          tokenValue: token.value,
          dataSets: [
            DataSet.currentWeather,
          ],
        );
      }
    }();
  }

  @override
  Widget build(BuildContext context) => const Scaffold();
}
