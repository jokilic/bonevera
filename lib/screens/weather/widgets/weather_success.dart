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

    final daysExceptToday = getDaysExceptToday(
      weather.forecastDaily?.days,
    );

    final todayHours = getNext24Hours(
      allHours: weather.forecastHourly?.hours,
    );

    return Column(
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
          locationName: location.locality,
        ),

        ///
        /// WEATHER ICON
        ///
        Expanded(
          flex: 7,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 56),
            child: Image.asset(
              currentConditionImage,
              alignment: Alignment.topCenter,
            ),
          ),
        ),

        Expanded(
          flex: 8,
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

              const SizedBox(height: 32),

              ///
              /// DAILY WEATHER
              ///
              Expanded(
                flex: 5,
                child: Row(
                  children: [
                    ///
                    /// TODAY
                    ///
                    if (today != null) ...[
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: WeatherDay(
                          title: getFormattedDate(
                            forecastStart: today.forecastStart,
                            forecastEnd: today.forecastEnd,
                          ),
                          conditionImage: getConditionImage(
                            passedConditionCode: today.conditionCode,
                            daylight: true,
                          ),
                          lowTemperature: getTemperatureString(
                            today.temperatureMin,
                          ),
                          highTemperature: getTemperatureString(
                            today.temperatureMax,
                          ),
                          conditionText: today.conditionCode.name,
                        ),
                      ),
                      const SizedBox(width: 16),
                    ],

                    ///
                    /// DAYS EXCEPT TODAY
                    ///
                    if (daysExceptToday?.isNotEmpty ?? false)
                      Expanded(
                        child: ListView.separated(
                          padding: const EdgeInsets.only(right: 16),
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: daysExceptToday!.length,
                          itemBuilder: (_, index) {
                            final day = daysExceptToday[index];

                            return WeatherDay(
                              title: getFormattedDate(
                                forecastStart: day.forecastStart,
                                forecastEnd: day.forecastEnd,
                              ),
                              conditionImage: getConditionImage(
                                passedConditionCode: day.conditionCode,
                                daylight: true,
                              ),
                              lowTemperature: getTemperatureString(
                                day.temperatureMin,
                              ),
                              highTemperature: getTemperatureString(
                                day.temperatureMax,
                              ),
                              conditionText: day.conditionCode.name,
                            );
                          },
                          separatorBuilder: (_, __) => const SizedBox(width: 16),
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
                flex: 4,
                child: WeatherHourTemperatureChart(
                  title: '24-hour forecast',
                  hours: todayHours,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
