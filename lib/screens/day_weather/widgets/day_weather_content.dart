import 'package:dough/dough.dart';
import 'package:flutter/material.dart';

import '../../../constants/enums.dart';
import '../../../models/day.dart';
import '../../../models/hour.dart';
import '../../../models/location/location.dart';
import '../../../util/parse/condition_code.dart';
import '../../../util/parse/date_time.dart';
import '../../../util/parse/temperature.dart';
import '../../weather/widgets/weather_current_temperature_condition.dart';
import 'day_weather_app_bar.dart';
import 'day_weather_hour.dart';

class DayWeatherContent extends StatefulWidget {
  final Location location;
  final Day day;
  final List<Hour> hours;

  const DayWeatherContent({
    required this.location,
    required this.day,
    required this.hours,
  });

  @override
  State<DayWeatherContent> createState() => _DayWeatherContentState();
}

class _DayWeatherContentState extends State<DayWeatherContent> {
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
  Widget build(BuildContext context) => Column(
    children: [
      ///
      /// APP BAR
      ///
      DayWeatherAppBar(
        onPressedBack: Navigator.of(context).pop,
        title: widget.location.locality ?? '--',
        subtitle: getFormattedDate(
          forecastStart: widget.day.forecastStart,
          forecastEnd: widget.day.forecastEnd,
        ),
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
                passedConditionCode: widget.day.conditionCode,
                daylight: true,
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
                widget.day.temperatureMax,
              ),
              conditionText: getConditionString(
                passedConditionCode: widget.day.conditionCode,
                daylight: true,
              ),
              currentHighTemperature: getTemperatureString(
                widget.day.temperatureMax,
              ),
              currentLowTemperature: getTemperatureString(
                widget.day.temperatureMin,
              ),
            ),

            const SizedBox(height: 32),

            ///
            /// HOURLY WEATHER
            ///
            Expanded(
              flex: 5,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: widget.hours.length,
                itemBuilder: (_, index) {
                  final hour = widget.hours[index];

                  return DayWeatherHour(
                    onPressed: () {},
                    title: getFormattedTime(
                      hour.forecastStart,
                    ),
                    conditionImage: getConditionImage(
                      passedConditionCode: hour.conditionCode,
                      daylight: hour.daylight ?? true,
                    ),
                    temperature: getTemperatureString(
                      hour.temperature,
                    ),
                    conditionText: getConditionString(
                      passedConditionCode: hour.conditionCode,
                      daylight: hour.daylight ?? true,
                    ),
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(width: 16),
              ),
            ),

            const SizedBox(height: 16),

            ///
            /// BOTTOM WEATHER WIDGET
            ///
            // Expanded(
            //   flex: 4,
            //   child: BoneveraButton(
            //     onPressed: toggleWeatherWidget,
            //     child: AnimatedSwitcher(
            //       duration: BoneveraDurations.fadeAnimation,
            //       switchInCurve: Curves.easeIn,
            //       switchOutCurve: Curves.easeIn,
            //       transitionBuilder: (child, listenable) => ZoomTransition(
            //         listenable: listenable,
            //         scaleInFactor: 0.88,
            //         scaleOutFactor: 1.14,
            //         child: child,
            //       ),
            //       child: switch (currentWeatherWidget) {
            //         WeatherWidget.chart => WeatherHourTemperatureChart(
            //           hours: get24HoursFromDateTime(
            //             allHours: widget.weather.forecastHourly?.hours,
            //             startTime: DateTime.now(),
            //           ),
            //         ),
            //         WeatherWidget.air => WeatherAdditionalAir(
            //           cloudCover: widget.weather.currentWeather?.cloudCover,
            //           humidity: widget.weather.currentWeather?.humidity,
            //           precipitationIntensity: widget.weather.currentWeather?.precipitationIntensity,
            //         ),
            //         WeatherWidget.temperature => WeatherAdditionalTemperature(
            //           temperatureApparent: widget.weather.currentWeather?.temperatureApparent,
            //           pressure: widget.weather.currentWeather?.pressure,
            //           uvIndex: widget.weather.currentWeather?.uvIndex,
            //         ),
            //         WeatherWidget.wind => WeatherAdditionalWind(
            //           visibility: widget.weather.currentWeather?.visibility,
            //           windDirection: widget.weather.currentWeather?.windDirection,
            //           windSpeed: widget.weather.currentWeather?.windSpeed,
            //         ),
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    ],
  );
}
