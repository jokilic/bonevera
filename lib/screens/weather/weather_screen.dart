import 'package:flutter/material.dart';

import '../../services/api_service.dart';
import '../../services/logger_service.dart';
import '../../services/timezone_service.dart';
import '../../services/token_service.dart';
import '../../theme/theme.dart';
import '../../util/dependencies.dart';
import 'weather_controller.dart';
import 'widgets/weather_drawer_button.dart';

class WeatherScreen extends StatefulWidget {
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
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 16,
        ),
        child: Column(
          children: [
            ///
            /// TOP WIDGET
            ///
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///
                /// LOCATIONS BUTTON
                ///
                const WeatherDrawerButton(),
                const SizedBox(width: 16),

                ///
                /// CURRENT LOCATION NAME
                ///
                Expanded(
                  child: Text(
                    'Zagreb',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: context.textStyles.currentLocation,
                  ),
                ),

                ///
                /// EMPTY SPACE
                ///
                const SizedBox(width: 16),
                const WeatherDrawerButton(
                  isHidden: true,
                ),
              ],
            ),

            ///
            /// WEATHER ICON
            ///
            const Placeholder(),

            ///
            /// TEMPERATURE & CONDITION
            ///
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ///
                /// TEMPERATURE
                ///
                Text(
                  '32°',
                  textAlign: TextAlign.center,
                  style: context.textStyles.currentTemperature,
                ),

                ///
                /// CONDITION & HIGH / LOW TEMPERATURES
                ///
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///
                      /// CONDITION
                      ///
                      Text(
                        'Mostly cloudy',
                        style: context.textStyles.currentCondition,
                      ),

                      const SizedBox(height: 2),

                      ///
                      /// HIGH / LOW TEMPERATURES
                      ///
                      Text.rich(
                        TextSpan(
                          text: 'H: ',
                          children: [
                            TextSpan(
                              text: '33°',
                              style: context.textStyles.currentHighLowTemperature.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const TextSpan(
                              text: ' | L: ',
                            ),
                            TextSpan(
                              text: '23°',
                              style: context.textStyles.currentHighLowTemperature.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        style: context.textStyles.currentHighLowTemperature,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
