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

  static const locationsTextField = TextStyle(
    fontFamily: 'ProductSans',
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static const locationsTitle = TextStyle(
    fontFamily: 'ProductSans',
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static const locationsName = TextStyle(
    fontFamily: 'ProductSans',
    fontSize: 22,
    fontWeight: FontWeight.w700,
  );

  static const locationsCountry = TextStyle(
    fontFamily: 'ProductSans',
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static const locationsNoLocation = TextStyle(
    fontFamily: 'ProductSans',
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static const locationsAppName = TextStyle(
    fontFamily: 'ProductSans',
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static const locationsAppVersion = TextStyle(
    fontFamily: 'ProductSans',
    fontSize: 14,
    fontWeight: FontWeight.w500,
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
  final TextStyle locationsTextField;
  final TextStyle locationsTitle;
  final TextStyle locationsName;
  final TextStyle locationsCountry;
  final TextStyle locationsNoLocation;
  final TextStyle locationsAppName;
  final TextStyle locationsAppVersion;

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
    required this.locationsTextField,
    required this.locationsTitle,
    required this.locationsName,
    required this.locationsCountry,
    required this.locationsNoLocation,
    required this.locationsAppName,
    required this.locationsAppVersion,
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
    TextStyle? locationsTextField,
    TextStyle? locationsTitle,
    TextStyle? locationsName,
    TextStyle? locationsCountry,
    TextStyle? locationsNoLocation,
    TextStyle? locationsAppName,
    TextStyle? locationsAppVersion,
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
    locationsTextField: locationsTextField ?? this.locationsTextField,
    locationsTitle: locationsTitle ?? this.locationsTitle,
    locationsName: locationsName ?? this.locationsName,
    locationsCountry: locationsCountry ?? this.locationsCountry,
    locationsNoLocation: locationsNoLocation ?? this.locationsNoLocation,
    locationsAppName: locationsAppName ?? this.locationsAppName,
    locationsAppVersion: locationsAppVersion ?? this.locationsAppVersion,
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
      locationsTextField: TextStyle.lerp(locationsTextField, other.locationsTextField, t)!,
      locationsTitle: TextStyle.lerp(locationsTitle, other.locationsTitle, t)!,
      locationsName: TextStyle.lerp(locationsName, other.locationsName, t)!,
      locationsCountry: TextStyle.lerp(locationsCountry, other.locationsCountry, t)!,
      locationsNoLocation: TextStyle.lerp(locationsNoLocation, other.locationsNoLocation, t)!,
      locationsAppName: TextStyle.lerp(locationsAppName, other.locationsAppName, t)!,
      locationsAppVersion: TextStyle.lerp(locationsAppVersion, other.locationsAppVersion, t)!,
    );
  }
}
