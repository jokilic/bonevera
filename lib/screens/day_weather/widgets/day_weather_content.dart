import 'package:dough/dough.dart';
import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

import '../../../constants/durations.dart';
import '../../../constants/enums.dart';
import '../../../models/day.dart';
import '../../../models/hour.dart';
import '../../../models/location/location.dart';
import '../../../routing.dart';
import '../../../util/dependencies.dart';
import '../../../util/parse/condition_code.dart';
import '../../../util/parse/date_time.dart';
import '../../../util/parse/temperature.dart';
import '../../../util/zoom_switcher_transition.dart';
import '../../../widgets/bonevera_button.dart';
import '../../../widgets/hour_temperature_chart.dart';
import '../day_weather_controller.dart';
import 'day_weather_app_bar.dart';
import 'day_weather_hour.dart';
import 'day_weather_temperature_condition.dart';

class DayWeatherContent extends WatchingWidget {
  final Location location;
  final Day day;
  final List<Hour> hours;

  const DayWeatherContent({
    required this.location,
    required this.day,
    required this.hours,
  });

  @override
  Widget build(BuildContext context) {
    final controller = getIt.get<DayWeatherController>(
      instanceName: day.toString(),
    );

    final currentWeatherWidget = watchValue<DayWeatherController, WeatherWidget>(
      (controller) => controller.currentWeatherWidget,
      instanceName: day.toString(),
    );

    return Column(
      children: [
        ///
        /// APP BAR
        ///
        DayWeatherAppBar(
          onPressedBack: Navigator.of(context).pop,
          title: location.locality ?? '--',
          subtitle: getFormattedDate(
            forecastStart: day.forecastStart,
            forecastEnd: day.forecastEnd,
          ),
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
                  passedConditionCode: day.conditionCode,
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
              /// TEMPERATURES & CONDITION
              ///
              DayWeatherTemperatureCondition(
                conditionText: getConditionString(
                  passedConditionCode: day.conditionCode,
                  daylight: true,
                ),
                highTemperature: getTemperatureString(
                  day.temperatureMax,
                ),
                lowTemperature: getTemperatureString(
                  day.temperatureMin,
                ),
              ),

              const SizedBox(height: 32),

              ///
              /// HOURLY WEATHER
              ///
              Expanded(
                flex: 5,
                child: ListView.separated(
                  controller: controller.hoursScrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: hours.length,
                  itemBuilder: (_, index) {
                    final hour = hours[index];

                    return DayWeatherHour(
                      onPressed: () => openHourWeather(
                        context,
                        location: location,
                        hour: hour,
                      ),
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
                        hours: hours,
                      ),
                      // TODO: Proper widgets here
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
}
