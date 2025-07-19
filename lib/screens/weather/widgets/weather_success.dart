import 'package:flutter/material.dart';

import '../../../models/response_weather.dart';
import '../../../util/parse.dart';
import 'weather_app_bar.dart';
import 'weather_current_temperature_condition.dart';
import 'weather_day.dart';

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
    final currentConditionImage = getConditionImage(
      passedConditionCode: weather.currentWeather?.conditionCode,
      daylight: weather.currentWeather?.daylight ?? true,
    );

    final today = getCurrentDay(
      weather.forecastDaily?.days,
    );

    final todayConditionImage = getConditionImage(
      passedConditionCode: today?.conditionCode,
      daylight: true,
    );
    final todayHighTemperature = getTemperatureString(
      today?.temperatureMax,
    );
    final todayLowTemperature = getTemperatureString(
      today?.temperatureMin,
    );

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ///
          /// APP BAR
          ///
          WeatherAppBar(
            onDrawerPressed: () {},
            locationName: 'Some location',
          ),

          ///
          /// WEATHER ICON
          ///
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Image.asset(currentConditionImage),
            ),
          ),

          ///
          /// CONTENT
          ///
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///
                /// CURRENT TEMPERATURE & CONDITION
                ///
                WeatherCurrentTemperatureCondition(
                  currentTemperature: currentTemperature,
                  currentHighTemperature: todayHighTemperature,
                  currentLowTemperature: todayLowTemperature,
                ),

                const SizedBox(height: 40),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ///
                    /// TODAY
                    ///
                    WeatherDay(
                      conditionImage: todayConditionImage,
                      lowTemperature: todayLowTemperature,
                      highTemperature: todayHighTemperature,
                    ),
                    const SizedBox(width: 16),

                    Expanded(
                      child: SizedBox(
                        height: 152,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: weather.forecastDaily?.days.length ?? 0,
                          itemBuilder: (_, index) {
                            final day = weather.forecastDaily!.days[index];

                            final conditionImage = getConditionImage(
                              passedConditionCode: day.conditionCode,
                              daylight: true,
                            );
                            final highTemperature = getTemperatureString(
                              day.temperatureMax,
                            );
                            final lowTemperature = getTemperatureString(
                              day.temperatureMin,
                            );

                            return WeatherDay(
                              conditionImage: conditionImage,
                              lowTemperature: lowTemperature,
                              highTemperature: highTemperature,
                            );
                          },
                          separatorBuilder: (_, __) => const SizedBox(width: 8),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
