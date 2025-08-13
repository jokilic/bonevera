import 'package:dough/dough.dart';
import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

import '../../../constants/durations.dart';
import '../../../constants/enums.dart';
import '../../../models/location/location.dart';
import '../../../models/response_weather.dart';
import '../../../routing.dart';
import '../../../util/dependencies.dart';
import '../../../util/parse/condition_code.dart';
import '../../../util/parse/date_time.dart';
import '../../../util/parse/temperature.dart';
import '../../../util/zoom_switcher_transition.dart';
import '../../../widgets/bonevera_button.dart';
import '../../../widgets/hour_temperature_chart.dart';
import '../weather_controller.dart';
import 'weather_additional_air.dart';
import 'weather_additional_temperature.dart';
import 'weather_additional_wind.dart';
import 'weather_app_bar.dart';
import 'weather_day.dart';
import 'weather_temperature_condition.dart';

class WeatherSuccess extends WatchingWidget {
  final Location location;
  final ResponseWeather weather;

  const WeatherSuccess({
    required this.location,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    final controller = getIt.get<WeatherController>(
      instanceName: location.toString(),
    );

    final currentWeatherWidget = watchValue<WeatherController, WeatherWidget>(
      (controller) => controller.currentWeatherWidget,
      instanceName: location.toString(),
    );

    return Column(
      children: [
        ///
        /// APP BAR
        ///
        WeatherAppBar(
          title: location.locality ?? '--',
        ),

        ///
        /// WEATHER ICON
        ///
        Expanded(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 56),
            child: PressableDough(
              onReleased: (details) {
                /// User dragged a lot
                if (details.delta.distance > 400) {
                  // TODO: Play some `auu` sound here
                }
              },
              child: Image.asset(
                getConditionImage(
                  passedConditionCode: weather.currentWeather?.conditionCode,
                  daylight: weather.currentWeather?.daylight ?? true,
                ),
                alignment: Alignment.topCenter,
              ),
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
              WeatherTemperatureCondition(
                currentTemperature: getTemperatureString(
                  weather.currentWeather?.temperature,
                ),
                conditionText: getConditionString(
                  passedConditionCode: weather.currentWeather?.conditionCode,
                  daylight: weather.currentWeather?.daylight ?? true,
                ),
                currentHighTemperature: getTemperatureString(
                  controller.today?.temperatureMax,
                ),
                currentLowTemperature: getTemperatureString(
                  controller.today?.temperatureMin,
                ),
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
                    if (controller.today != null) ...[
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: WeatherDay(
                          onPressed: () => openDayWeather(
                            context,
                            location: location,
                            day: controller.today!,
                            hours: controller.todayHours ?? [],
                          ),
                          title: getFormattedDate(
                            forecastStart: controller.today!.forecastStart,
                            forecastEnd: controller.today!.forecastEnd,
                          ),
                          conditionImage: getConditionImage(
                            passedConditionCode: controller.today!.conditionCode,
                            daylight: true,
                          ),
                          lowTemperature: getTemperatureString(
                            controller.today!.temperatureMin,
                          ),
                          highTemperature: getTemperatureString(
                            controller.today!.temperatureMax,
                          ),
                          conditionText: getConditionString(
                            passedConditionCode: controller.today!.conditionCode,
                            daylight: true,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                    ],

                    ///
                    /// DAYS EXCEPT TODAY
                    ///
                    if (controller.daysExceptToday?.isNotEmpty ?? false)
                      Expanded(
                        child: ListView.separated(
                          padding: const EdgeInsets.only(right: 16),
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.daysExceptToday!.length,
                          itemBuilder: (_, index) {
                            final day = controller.daysExceptToday![index];

                            return WeatherDay(
                              onPressed: () => openDayWeather(
                                context,
                                location: location,
                                day: day,
                                hours: get24HoursFromDateTime(
                                  allHours: weather.forecastHourly?.hours,
                                  startTime: day.forecastStart.toLocal(),
                                ),
                              ),

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
                              conditionText: getConditionString(
                                passedConditionCode: day.conditionCode,
                                daylight: true,
                              ),
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
              /// BOTTOM WEATHER WIDGET
              ///
              Expanded(
                flex: 4,
                child: BoneveraButton(
                  onPressed: controller.toggleWeatherWidget,
                  child: AnimatedSwitcher(
                    duration: BoneveraDurations.fadeAnimation,
                    switchInCurve: Curves.easeIn,
                    switchOutCurve: Curves.easeIn,
                    transitionBuilder: (child, listenable) => ZoomTransition(
                      listenable: listenable,
                      scaleInFactor: 0.88,
                      scaleOutFactor: 1.14,
                      child: child,
                    ),
                    child: switch (currentWeatherWidget) {
                      WeatherWidget.chart => HourTemperatureChart(
                        hours: controller.todayHours ?? [],
                      ),
                      WeatherWidget.air => WeatherAdditionalAir(
                        cloudCover: weather.currentWeather?.cloudCover,
                        humidity: weather.currentWeather?.humidity,
                        precipitationIntensity: weather.currentWeather?.precipitationIntensity,
                      ),
                      WeatherWidget.temperature => WeatherAdditionalTemperature(
                        temperatureApparent: weather.currentWeather?.temperatureApparent,
                        pressure: weather.currentWeather?.pressure,
                        uvIndex: weather.currentWeather?.uvIndex,
                      ),
                      WeatherWidget.wind => WeatherAdditionalWind(
                        visibility: weather.currentWeather?.visibility,
                        windDirection: weather.currentWeather?.windDirection,
                        windSpeed: weather.currentWeather?.windSpeed,
                      ),
                    },
                  ),
                ),
              ),

              ///
              /// BOTTOM SPACING
              ///
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }
}
