import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../constants/enums.dart';
import '../../models/day.dart';
import '../../models/hour.dart';
import '../../services/logger_service.dart';

class DayWeatherController implements Disposable {
  ///
  /// CONSTRUCTOR
  ///

  final LoggerService logger;

  DayWeatherController({
    required this.logger,
  });

  ///
  /// VARIABLES
  ///

  Day? today;
  List<Hour>? todayHours;
  List<Day>? daysExceptToday;

  final currentWeatherWidget = ValueNotifier<WeatherWidget>(
    WeatherWidget.chart,
  );

  final hoursScrollController = ScrollController();

  ///
  /// DISPOSE
  ///

  @override
  void onDispose() {
    currentWeatherWidget.dispose();
    hoursScrollController.dispose();
  }

  ///
  /// METHODS
  ///

  /// Triggered when the user presses bottom weather [Widget]
  void toggleWeatherWidget() {
    final currentIndex = WeatherWidget.values.indexOf(currentWeatherWidget.value);
    final nextIndex = (currentIndex + 1) % WeatherWidget.values.length;
    currentWeatherWidget.value = WeatherWidget.values[nextIndex];
  }

  /// Scrolls hours to proper location
  void scrollHours({required int hour}) {
    /// Card width + separator
    const itemWidth = 104 + 16;

    /// Scroll to `9AM`
    final targetOffset = itemWidth * hour;

    /// Trigger scroll
    hoursScrollController.jumpTo(
      targetOffset.toDouble(),
    );

    // or animateTo for smooth scroll:
    // scrollController.animateTo(
    //   targetOffset,
    //   duration: const Duration(milliseconds: 300),
    //   curve: Curves.easeOut,
    // );
  }
}
