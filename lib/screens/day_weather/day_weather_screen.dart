import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../constants/durations.dart';
import '../../models/day.dart';
import '../../models/hour.dart';
import '../../models/location/location.dart';
import '../../theme/theme.dart';
import 'widgets/day_weather_content.dart';

class DayWeatherScreen extends StatelessWidget {
  final Location location;
  final Day day;
  final List<Hour> hours;

  const DayWeatherScreen({
    required this.location,
    required this.day,
    required this.hours,
    required super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: context.colors.weatherBackground,
    body: SafeArea(
      child: Animate(
        effects: const [
          FadeEffect(
            curve: Curves.easeIn,
            duration: CJVnkDurations.fadeAnimation,
          ),
        ],
        child: DayWeatherContent(
          location: location,
          day: day,
          hours: hours,
        ),
      ),
    ),
  );
}
