import 'package:flutter/material.dart';

import 'models/day.dart';
import 'models/hour.dart';
import 'models/location/location.dart';
import 'screens/day_weather/day_weather_screen.dart';
import 'util/navigation.dart';

/// Opens [ReadScreen]
void openDayWeather(
  BuildContext context, {
  required Location location,
  required Day day,
  required List<Hour> hours,
}) => pushScreen(
  DayWeatherScreen(
    location: location,
    day: day,
    hours: hours,
    key: ValueKey(day),
  ),
  context: context,
  isCircularTransition: true,
);
