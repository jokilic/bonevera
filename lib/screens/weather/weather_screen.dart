import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:watch_it/watch_it.dart';

import '../../constants/durations.dart';
import '../../models/location/location.dart';
import '../../services/api_service.dart';
import '../../services/logger_service.dart';
import '../../services/timezone_service.dart';
import '../../services/token_service.dart';
import '../../theme/theme.dart';
import '../../util/dependencies.dart';
import 'weather_controller.dart';
import 'widgets/weather_content.dart';

class WeatherScreen extends WatchingStatefulWidget {
  final Location location;

  const WeatherScreen({
    required this.location,
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
        location: widget.location,
      ),
      instanceName: widget.location.toString(),
      afterRegister: (controller) => controller.getWeather(),
    );
  }

  @override
  void dispose() {
    // getIt.unregister<WeatherController>(
    //   instanceName: widget.location.toString(),
    // );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final weatherState = watchIt<WeatherController>(
      instanceName: widget.location.toString(),
    ).value;

    return Scaffold(
      backgroundColor: context.colors.weatherBackground,
      body: SafeArea(
        child: Animate(
          key: ValueKey(weatherState),
          effects: const [
            FadeEffect(
              curve: Curves.easeIn,
              duration: BoneveraDurations.fadeAnimation,
            ),
          ],
          child: WeatherContent(
            location: widget.location,
            weatherState: weatherState,
          ),
        ),
      ),
    );
  }
}
