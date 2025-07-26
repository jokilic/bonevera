import 'package:flutter/material.dart';

import '../../../models/location/location.dart';
import '../../../models/response_weather.dart';
import '../../../util/dependencies.dart';
import '../../../util/parse/condition_code.dart';
import '../../../util/parse/date_time.dart';
import '../../../util/parse/temperature.dart';
import '../../main/main_controller.dart';
import 'weather_app_bar.dart';
import 'weather_current_temperature_condition.dart';
import 'weather_day.dart';
import 'weather_hour_temperature_chart.dart';

class WeatherSuccess extends StatelessWidget {
  final Location location;
  final ResponseWeather weather;

  const WeatherSuccess({
    required this.location,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    final currentTemperature = getTemperatureString(
      weather.currentWeather?.temperature,
    );
    final currentConditionText = weather.currentWeather?.conditionCode.name ?? 'no';
    final currentConditionImage = getConditionImage(
      passedConditionCode: weather.currentWeather?.conditionCode,
      daylight: weather.currentWeather?.daylight ?? true,
    );

    final today = getCurrentDay(
      weather.forecastDaily?.days,
    );
    final todayHighTemperature = getTemperatureString(
      today?.temperatureMax,
    );
    final todayLowTemperature = getTemperatureString(
      today?.temperatureMin,
    );

    final todayHours = getNext24Hours(
      allHours: weather.forecastHourly?.hours,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Column(
        children: [
          ///
          /// APP BAR
          ///
          WeatherAppBar(
            onDrawerPressed: () async {
              final location = await getIt
                  .get<MainController>(instanceName: 'main')
                  .getLocationFromAddress(
                    address: 'Siget 18B, Zagreb',
                  );

              await getIt
                  .get<MainController>(instanceName: 'main')
                  .getAddressFromLocation(
                    latitude: location.latitude,
                    longitude: location.longitude,
                  );
            },
            locationName: location.name,
          ),

          ///
          /// WEATHER ICON
          ///
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Image.asset(
                currentConditionImage,
                alignment: Alignment.topCenter,
              ),
            ),
          ),

          ///
          /// CONTENT
          ///
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///
                /// CURRENT TEMPERATURE & CONDITION
                ///
                WeatherCurrentTemperatureCondition(
                  currentTemperature: currentTemperature,
                  conditionText: currentConditionText,
                  currentHighTemperature: todayHighTemperature,
                  currentLowTemperature: todayLowTemperature,
                ),

                const SizedBox(height: 40),

                ///
                /// DAILY WEATHER
                ///
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      ///
                      /// TODAY
                      ///
                      // TODO: Put only `Today` here

                      ///
                      /// OTHER DAYS
                      ///
                      Expanded(
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: weather.forecastDaily?.days.length ?? 0,
                          itemBuilder: (_, index) {
                            final day = weather.forecastDaily!.days[index];

                            final forecastTitle = getFormattedDate(
                              forecastStart: day.forecastStart,
                              forecastEnd: day.forecastEnd,
                            );
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
                            final conditionText = day.conditionCode.name;

                            return WeatherDay(
                              title: forecastTitle,
                              conditionImage: conditionImage,
                              lowTemperature: lowTemperature,
                              highTemperature: highTemperature,
                              conditionText: conditionText,
                            );
                          },
                          separatorBuilder: (_, __) => const SizedBox(width: 8),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                ///
                /// HOURLY CHART
                ///
                Expanded(
                  flex: 2,
                  child: WeatherHourTemperatureChart(
                    title: '24-hour forecast',
                    hours: todayHours,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
