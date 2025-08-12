import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../constants/durations.dart';
import '../../models/hour.dart';
import '../../models/location/location.dart';
import '../../theme/theme.dart';
import 'widgets/hour_weather_content.dart';

class HourWeatherScreen extends StatelessWidget {
  final Location location;
  final Hour hour;

  const HourWeatherScreen({
    required this.location,
    required this.hour,
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
            duration: BoneveraDurations.fadeAnimation,
          ),
        ],
        child: HourWeatherContent(
          location: location,
          hour: hour,
        ),
      ),
    ),
  );
}
