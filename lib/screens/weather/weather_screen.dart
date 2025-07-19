import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:watch_it/watch_it.dart';

import '../../constants/durations.dart';
import '../../services/api_service.dart';
import '../../services/logger_service.dart';
import '../../services/timezone_service.dart';
import '../../services/token_service.dart';
import '../../util/dependencies.dart';
import 'weather_controller.dart';
import 'widgets/weather_content.dart';

class WeatherScreen extends WatchingStatefulWidget {
  final String instanceName;

  const WeatherScreen({
    required this.instanceName,
    required super.key,
  });

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();

    registerIfNotInitialized<WeatherController>(
      () => WeatherController(
        logger: getIt.get<LoggerService>(),
        api: getIt.get<APIService>(),
        timezone: getIt.get<TimezoneService>(),
        token: getIt.get<TokenService>(),
      ),
      instanceName: widget.instanceName,
      afterRegister: (controller) => controller.getWeather(),
    );
  }

  @override
  void dispose() {
    getIt.unregister<WeatherController>(
      instanceName: widget.instanceName,
    );

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final weatherState = watchIt<WeatherController>(
      instanceName: widget.instanceName,
    ).value;

    return Scaffold(
      body: SafeArea(
        child: Animate(
          key: ValueKey(weatherState),
          effects: const [
            FadeEffect(
              curve: Curves.easeIn,
              duration: CJVnkDurations.fadeAnimation,
            ),
          ],
          child: WeatherContent(
            weatherState: weatherState,
          ),
        ),
      ),
    );
  }
}
