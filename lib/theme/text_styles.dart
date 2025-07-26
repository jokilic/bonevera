import 'package:flutter/material.dart';

abstract class CJVnkTextStyles {
  static const currentLocation = TextStyle(
    fontFamily: 'ProductSans',
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static const currentTemperature = TextStyle(
    fontFamily: 'ProductSans',
    fontSize: 112,
    fontWeight: FontWeight.w700,
    height: 0.75,
  );

  static const currentCondition = TextStyle(
    fontFamily: 'ProductSans',
    fontSize: 14,
    fontWeight: FontWeight.w700,
    height: 1.25,
  );

  static const currentHighLowTemperature = TextStyle(
    fontFamily: 'ProductSans',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.25,
  );

  static const currentDayTitle = TextStyle(
    fontFamily: 'ProductSans',
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  static const currentDayHighLowTemperature = TextStyle(
    fontFamily: 'ProductSans',
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static const currentDayCondition = TextStyle(
    fontFamily: 'ProductSans',
    fontSize: 10,
    fontWeight: FontWeight.w700,
  );

  static const currentHourChartTitle = TextStyle(
    fontFamily: 'ProductSans',
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  static const currentHourChartTemperature = TextStyle(
    fontFamily: 'ProductSans',
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );
}

class CJVnkTextThemesExtension extends ThemeExtension<CJVnkTextThemesExtension> {
  final TextStyle currentLocation;
  final TextStyle currentTemperature;
  final TextStyle currentCondition;
  final TextStyle currentHighLowTemperature;
  final TextStyle currentDayTitle;
  final TextStyle currentDayHighLowTemperature;
  final TextStyle currentDayCondition;
  final TextStyle currentHourChartTitle;
  final TextStyle currentHourChartTemperature;

  const CJVnkTextThemesExtension({
    required this.currentLocation,
    required this.currentTemperature,
    required this.currentCondition,
    required this.currentHighLowTemperature,
    required this.currentDayTitle,
    required this.currentDayHighLowTemperature,
    required this.currentDayCondition,
    required this.currentHourChartTitle,
    required this.currentHourChartTemperature,
  });

  @override
  ThemeExtension<CJVnkTextThemesExtension> copyWith({
    TextStyle? currentLocation,
    TextStyle? currentTemperature,
    TextStyle? currentCondition,
    TextStyle? currentHighLowTemperature,
    TextStyle? currentDayTitle,
    TextStyle? currentDayHighLowTemperature,
    TextStyle? currentDayCondition,
    TextStyle? currentHourChartTitle,
    TextStyle? currentHourChartTemperature,
  }) => CJVnkTextThemesExtension(
    currentLocation: currentLocation ?? this.currentLocation,
    currentTemperature: currentTemperature ?? this.currentTemperature,
    currentCondition: currentCondition ?? this.currentCondition,
    currentHighLowTemperature: currentHighLowTemperature ?? this.currentHighLowTemperature,
    currentDayTitle: currentDayTitle ?? this.currentDayTitle,
    currentDayHighLowTemperature: currentDayHighLowTemperature ?? this.currentDayHighLowTemperature,
    currentDayCondition: currentDayCondition ?? this.currentDayCondition,
    currentHourChartTitle: currentHourChartTitle ?? this.currentHourChartTitle,
    currentHourChartTemperature: currentHourChartTemperature ?? this.currentHourChartTemperature,
  );

  @override
  ThemeExtension<CJVnkTextThemesExtension> lerp(
    covariant ThemeExtension<CJVnkTextThemesExtension>? other,
    double t,
  ) {
    if (other is! CJVnkTextThemesExtension) {
      return this;
    }

    return CJVnkTextThemesExtension(
      currentLocation: TextStyle.lerp(currentLocation, other.currentLocation, t)!,
      currentTemperature: TextStyle.lerp(currentTemperature, other.currentTemperature, t)!,
      currentCondition: TextStyle.lerp(currentCondition, other.currentCondition, t)!,
      currentHighLowTemperature: TextStyle.lerp(currentHighLowTemperature, other.currentHighLowTemperature, t)!,
      currentDayTitle: TextStyle.lerp(currentDayTitle, other.currentDayTitle, t)!,
      currentDayHighLowTemperature: TextStyle.lerp(currentDayHighLowTemperature, other.currentDayHighLowTemperature, t)!,
      currentDayCondition: TextStyle.lerp(currentDayCondition, other.currentDayCondition, t)!,
      currentHourChartTitle: TextStyle.lerp(currentHourChartTitle, other.currentHourChartTitle, t)!,
      currentHourChartTemperature: TextStyle.lerp(currentHourChartTemperature, other.currentHourChartTemperature, t)!,
    );
  }
}
