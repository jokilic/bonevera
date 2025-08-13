import 'package:dough/dough.dart';
import 'package:flutter/material.dart';

import '../../../constants/durations.dart';
import '../../../constants/enums.dart';
import '../../../models/hour.dart';
import '../../../models/location/location.dart';
import '../../../util/parse/condition_code.dart';
import '../../../util/parse/date_time.dart';
import '../../../util/parse/temperature.dart';
import '../../../util/zoom_switcher_transition.dart';
import '../../../widgets/bonevera_button.dart';
import 'hour_weather_app_bar.dart';
import 'hour_weather_temperature_condition.dart';

class HourWeatherContent extends StatefulWidget {
  final Location location;
  final Hour hour;

  const HourWeatherContent({
    required this.location,
    required this.hour,
  });

  @override
  State<HourWeatherContent> createState() => _HourWeatherContentState();
}

class _HourWeatherContentState extends State<HourWeatherContent> {
  // TODO: Move this logic in controller

  var currentWeatherWidget = WeatherWidget.chart;

  void toggleWeatherWidget() => setState(() {
    final currentIndex = WeatherWidget.values.indexOf(currentWeatherWidget);
    final nextIndex = (currentIndex + 1) % WeatherWidget.values.length;
    currentWeatherWidget = WeatherWidget.values[nextIndex];
  });

  @override
  Widget build(BuildContext context) => Column(
    children: [
      ///
      /// APP BAR
      ///
      HourWeatherAppBar(
        onPressedBack: Navigator.of(context).pop,
        title: widget.location.locality ?? '--',
        subtitle:
            '${getFormattedDate(
              forecastStart: widget.hour.forecastStart,
            )} at ${getFormattedTime(
              widget.hour.forecastStart,
            )}',
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
                passedConditionCode: widget.hour.conditionCode,
                daylight: widget.hour.daylight ?? true,
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
            HourWeatherTemperatureCondition(
              currentTemperature: getTemperatureString(
                widget.hour.temperature,
              ),
              conditionText: getConditionString(
                passedConditionCode: widget.hour.conditionCode,
                daylight: widget.hour.daylight ?? true,
              ),
              feelsLikeTemperature: getTemperatureString(
                widget.hour.temperatureApparent,
              ),
            ),

            const SizedBox(height: 32),

            ///
            /// HOURLY WEATHER
            ///
            // Expanded(
            //   flex: 5,
            //   child: ListView.separated(
            //     padding: const EdgeInsets.symmetric(horizontal: 16),
            //     physics: const BouncingScrollPhysics(),
            //     scrollDirection: Axis.horizontal,
            //     itemCount: widget.hours.length,
            //     itemBuilder: (_, index) {
            //       final hour = widget.hours[index];

            //       return DayWeatherHour(
            //         onPressed: () {},
            //         title: getFormattedTime(
            //           hour.forecastStart,
            //         ),
            //         conditionImage: getConditionImage(
            //           passedConditionCode: hour.conditionCode,
            //           daylight: widget.hour.daylight??true,
            //         ),
            //         temperature: getTemperatureString(
            //           hour.temperature,
            //         ),
            //         conditionText: getConditionString(
            //           passedConditionCode: hour.conditionCode,
            //           daylight: widget.hour.daylight??true,
            //         ),
            //       );
            //     },
            //     separatorBuilder: (_, __) => const SizedBox(width: 16),
            //   ),
            // ),
            const SizedBox(height: 16),

            ///
            /// BOTTOM WEATHER WIDGET
            ///
            Expanded(
              flex: 4,
              child: BoneveraButton(
                onPressed: toggleWeatherWidget,
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
                    // TODO: Proper widgets here
                    // WeatherWidget.chart => HourTemperatureChart(
                    //   hours: widget.hours,
                    // ),
                    _ => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.indigoAccent,
                        borderRadius: BorderRadius.circular(16),
                      ),
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
