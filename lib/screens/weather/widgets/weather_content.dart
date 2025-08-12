import 'package:flutter/material.dart';

import '../../../models/location/location.dart';
import '../../../util/state.dart';
import 'weather_success.dart';

class WeatherContent extends StatelessWidget {
  final Location location;
  final BoneveraState weatherState;

  const WeatherContent({
    required this.location,
    required this.weatherState,
  });

  @override
  Widget build(BuildContext context) => switch (weatherState) {
    Initial() => Container(
      height: 100,
      width: 100,
      color: Colors.blue,
    ),
    Loading() => Container(
      height: 100,
      width: 100,
      color: Colors.yellowAccent,
    ),
    Empty() => Container(
      height: 100,
      width: 100,
      color: Colors.grey,
    ),
    Error() => Container(
      height: 100,
      width: 100,
      color: Colors.red,
    ),
    Success() => WeatherSuccess(
      location: location,
      weather: (weatherState as Success).data,
    ),
  };
}
