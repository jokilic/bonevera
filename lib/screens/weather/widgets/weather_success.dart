import 'package:dough/dough.dart';
import 'package:flutter/material.dart';

import '../../../constants/durations.dart';
import '../../../constants/enums.dart';
import '../../../models/location/location.dart';
import '../../../models/response_weather.dart';
import '../../../util/parse/condition_code.dart';
import '../../../util/parse/date_time.dart';
import '../../../util/parse/temperature.dart';
import '../../../util/zoom_switcher_transition.dart';
import '../../../widgets/cjvnk_button.dart';
import 'weather_additional_air.dart';
import 'weather_additional_temperature.dart';
import 'weather_additional_wind.dart';
import 'weather_app_bar.dart';
import 'weather_current_temperature_condition.dart';
import 'weather_day.dart';
import 'weather_hour_temperature_chart.dart';

class WeatherSuccess extends StatefulWidget {
  final Location location;
  final ResponseWeather weather;

  const WeatherSuccess({
    required this.location,
    required this.weather,
  });

  @override
  State<WeatherSuccess> createState() => _WeatherSuccessState();
}

class _WeatherSuccessState extends State<WeatherSuccess> {
  var currentWeatherWidget = WeatherWidget.chart;

  final weatherWidgets = [
    WeatherWidget.chart,
    WeatherWidget.air,
    WeatherWidget.temperature,
    WeatherWidget.wind,
  ];

  void toggleWeatherWidget() => setState(() {
    final currentIndex = weatherWidgets.indexOf(currentWeatherWidget);
    final nextIndex = (currentIndex + 1) % weatherWidgets.length;
    currentWeatherWidget = weatherWidgets[nextIndex];
  });

  @override
  Widget build(BuildContext context) {
    final today = getCurrentDay(
      widget.weather.forecastDaily?.days,
    );

    final daysExceptToday = getDaysExceptToday(
      widget.weather.forecastDaily?.days,
    );

    return Column(
      children: [
        ///
        /// APP BAR
        ///
        WeatherAppBar(
          locationName: widget.location.locality ?? '--',
        ),

        ///
        /// WEATHER ICON
        ///
        Expanded(
          flex: 7,
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
                  passedConditionCode: widget.weather.currentWeather?.conditionCode,
                  daylight: widget.weather.currentWeather?.daylight ?? true,
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
              WeatherCurrentTemperatureCondition(
                currentTemperature: getTemperatureString(
                  widget.weather.currentWeather?.temperature,
                ),
                conditionText: getConditionString(
                  passedConditionCode: widget.weather.currentWeather?.conditionCode,
                  daylight: widget.weather.currentWeather?.daylight ?? true,
                ),
                currentHighTemperature: getTemperatureString(
                  today?.temperatureMax,
                ),
                currentLowTemperature: getTemperatureString(
                  today?.temperatureMin,
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
                          conditionText: getConditionString(
                            passedConditionCode: today.conditionCode,
                            daylight: true,
                          ),
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
                child: CJVnkButton(
                  onPressed: toggleWeatherWidget,
                  child: AnimatedSwitcher(
                    duration: CJVnkDurations.fadeAnimation,
                    switchInCurve: Curves.easeIn,
                    switchOutCurve: Curves.easeIn,
                    transitionBuilder: (child, listenable) => ZoomTransition(
                      listenable: listenable,
                      scaleInFactor: 0.88,
                      scaleOutFactor: 1.14,
                      child: child,
                    ),
                    child: switch (currentWeatherWidget) {
                      WeatherWidget.chart => WeatherHourTemperatureChart(
                        hours: get24HoursFromDateTime(
                          allHours: widget.weather.forecastHourly?.hours,
                          startTime: DateTime.now(),
                        ),
                      ),
                      WeatherWidget.air => WeatherAdditionalAir(
                        cloudCover: widget.weather.currentWeather?.cloudCover,
                        humidity: widget.weather.currentWeather?.humidity,
                        precipitationIntensity: widget.weather.currentWeather?.precipitationIntensity,
                      ),
                      WeatherWidget.temperature => WeatherAdditionalTemperature(
                        temperatureApparent: widget.weather.currentWeather?.temperatureApparent,
                        pressure: widget.weather.currentWeather?.pressure,
                        uvIndex: widget.weather.currentWeather?.uvIndex,
                      ),
                      WeatherWidget.wind => WeatherAdditionalWind(
                        visibility: widget.weather.currentWeather?.visibility,
                        windDirection: widget.weather.currentWeather?.windDirection,
                        windSpeed: widget.weather.currentWeather?.windSpeed,
                      ),
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
