import 'package:flutter/material.dart';

import '../weather/weather_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) => const Scaffold(
    body: WeatherScreen(
      instanceName: 'Zagreb',
      key: ValueKey(
        'Zagreb',
      ),
    ),
  );
}
