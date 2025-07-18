import 'package:flutter/material.dart';

import '../../../models/response_weather.dart';
import '../../../theme/theme.dart';
import '../../../util/string.dart';
import 'weather_app_bar.dart';

class WeatherSuccess extends StatelessWidget {
  final ResponseWeather weather;

  const WeatherSuccess({
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    final currentTemperature = getTemperatureString(
      weather.currentWeather?.temperature,
    );
    final currentHighTemperature = getTemperatureString(
      weather.forecastDaily?.days.firstOrNull?.temperatureMax,
    );
    final currentLowTemperature = getTemperatureString(
      weather.forecastDaily?.days.firstOrNull?.temperatureMin,
    );

    return Column(
      children: [
        ///
        /// APP BAR
        ///
        WeatherAppBar(
          onDrawerPressed: () {},
          locationName: 'Zagreb',
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
              currentTemperature,
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
                          text: currentHighTemperature,
                          style: context.textStyles.currentHighLowTemperature.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const TextSpan(
                          text: ' | L: ',
                        ),
                        TextSpan(
                          text: currentLowTemperature,
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
    );
  }
}
