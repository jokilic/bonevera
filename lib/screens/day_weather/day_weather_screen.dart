import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../constants/durations.dart';
import '../../models/day.dart';
import '../../models/hour.dart';
import '../../models/location/location.dart';
import '../../services/logger_service.dart';
import '../../theme/theme.dart';
import '../../util/dependencies.dart';
import 'day_weather_controller.dart';
import 'widgets/day_weather_content.dart';

class DayWeatherScreen extends StatefulWidget {
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
  State<DayWeatherScreen> createState() => _DayWeatherScreenState();
}

class _DayWeatherScreenState extends State<DayWeatherScreen> {
  @override
  void initState() {
    super.initState();

    registerIfNotInitialized<DayWeatherController>(
      () => DayWeatherController(
        logger: getIt.get<LoggerService>(),
      ),
      instanceName: widget.day.toString(),
      afterRegister: (controller) => WidgetsBinding.instance.addPostFrameCallback(
        (_) => controller.scrollHours(hour: 9),
      ),
    );
  }

  @override
  void dispose() {
    getIt.unregister<DayWeatherController>(
      instanceName: widget.day.toString(),
    );
    super.dispose();
  }

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
        child: DayWeatherContent(
          location: widget.location,
          day: widget.day,
          hours: widget.hours,
        ),
      ),
    ),
  );
}
