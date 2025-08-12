import 'package:flutter/material.dart';

abstract class BoneveraTextStyles {
  static const appBarTitle = TextStyle(
    fontFamily: 'ProductSans',
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static const appBarSubtitle = TextStyle(
    fontFamily: 'ProductSans',
    fontSize: 18,
    fontWeight: FontWeight.w500,
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

  static const dayTitle = TextStyle(
    fontFamily: 'ProductSans',
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  static const dayHighLowTemperature = TextStyle(
    fontFamily: 'ProductSans',
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static const dayCondition = TextStyle(
    fontFamily: 'ProductSans',
    fontSize: 10,
    fontWeight: FontWeight.w700,
  );

  static const chartTitle = TextStyle(
    fontFamily: 'ProductSans',
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  static const chartTemperature = TextStyle(
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

  static const weatherAdditionalValue = TextStyle(
    fontFamily: 'ProductSans',
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static const weatherAdditionalSmallValue = TextStyle(
    fontFamily: 'ProductSans',
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  static const weatherAdditionalTitle = TextStyle(
    fontFamily: 'ProductSans',
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
}

class BoneveraTextThemesExtension extends ThemeExtension<BoneveraTextThemesExtension> {
  final TextStyle appBarTitle;
  final TextStyle appBarSubtitle;
  final TextStyle currentTemperature;
  final TextStyle currentCondition;
  final TextStyle currentHighLowTemperature;
  final TextStyle dayTitle;
  final TextStyle dayHighLowTemperature;
  final TextStyle dayCondition;
  final TextStyle chartTitle;
  final TextStyle chartTemperature;
  final TextStyle locationsTextField;
  final TextStyle locationsTitle;
  final TextStyle locationsName;
  final TextStyle locationsCountry;
  final TextStyle locationsNoLocation;
  final TextStyle locationsAppName;
  final TextStyle locationsAppVersion;
  final TextStyle weatherAdditionalValue;
  final TextStyle weatherAdditionalSmallValue;
  final TextStyle weatherAdditionalTitle;

  const BoneveraTextThemesExtension({
    required this.appBarTitle,
    required this.appBarSubtitle,
    required this.currentTemperature,
    required this.currentCondition,
    required this.currentHighLowTemperature,
    required this.dayTitle,
    required this.dayHighLowTemperature,
    required this.dayCondition,
    required this.chartTitle,
    required this.chartTemperature,
    required this.locationsTextField,
    required this.locationsTitle,
    required this.locationsName,
    required this.locationsCountry,
    required this.locationsNoLocation,
    required this.locationsAppName,
    required this.locationsAppVersion,
    required this.weatherAdditionalValue,
    required this.weatherAdditionalSmallValue,
    required this.weatherAdditionalTitle,
  });

  @override
  ThemeExtension<BoneveraTextThemesExtension> copyWith({
    TextStyle? appBarTitle,
    TextStyle? appBarSubtitle,
    TextStyle? currentTemperature,
    TextStyle? currentCondition,
    TextStyle? currentHighLowTemperature,
    TextStyle? dayTitle,
    TextStyle? dayHighLowTemperature,
    TextStyle? dayCondition,
    TextStyle? chartTitle,
    TextStyle? chartTemperature,
    TextStyle? locationsTextField,
    TextStyle? locationsTitle,
    TextStyle? locationsName,
    TextStyle? locationsCountry,
    TextStyle? locationsNoLocation,
    TextStyle? locationsAppName,
    TextStyle? locationsAppVersion,
    TextStyle? weatherAdditionalValue,
    TextStyle? weatherAdditionalSmallValue,
    TextStyle? weatherAdditionalTitle,
  }) => BoneveraTextThemesExtension(
    appBarTitle: appBarTitle ?? this.appBarTitle,
    appBarSubtitle: appBarSubtitle ?? this.appBarSubtitle,
    currentTemperature: currentTemperature ?? this.currentTemperature,
    currentCondition: currentCondition ?? this.currentCondition,
    currentHighLowTemperature: currentHighLowTemperature ?? this.currentHighLowTemperature,
    dayTitle: dayTitle ?? this.dayTitle,
    dayHighLowTemperature: dayHighLowTemperature ?? this.dayHighLowTemperature,
    dayCondition: dayCondition ?? this.dayCondition,
    chartTitle: chartTitle ?? this.chartTitle,
    chartTemperature: chartTemperature ?? this.chartTemperature,
    locationsTextField: locationsTextField ?? this.locationsTextField,
    locationsTitle: locationsTitle ?? this.locationsTitle,
    locationsName: locationsName ?? this.locationsName,
    locationsCountry: locationsCountry ?? this.locationsCountry,
    locationsNoLocation: locationsNoLocation ?? this.locationsNoLocation,
    locationsAppName: locationsAppName ?? this.locationsAppName,
    locationsAppVersion: locationsAppVersion ?? this.locationsAppVersion,
    weatherAdditionalValue: weatherAdditionalValue ?? this.weatherAdditionalValue,
    weatherAdditionalSmallValue: weatherAdditionalSmallValue ?? this.weatherAdditionalSmallValue,
    weatherAdditionalTitle: weatherAdditionalTitle ?? this.weatherAdditionalTitle,
  );

  @override
  ThemeExtension<BoneveraTextThemesExtension> lerp(
    covariant ThemeExtension<BoneveraTextThemesExtension>? other,
    double t,
  ) {
    if (other is! BoneveraTextThemesExtension) {
      return this;
    }

    return BoneveraTextThemesExtension(
      appBarTitle: TextStyle.lerp(appBarTitle, other.appBarTitle, t)!,
      appBarSubtitle: TextStyle.lerp(appBarSubtitle, other.appBarSubtitle, t)!,
      currentTemperature: TextStyle.lerp(currentTemperature, other.currentTemperature, t)!,
      currentCondition: TextStyle.lerp(currentCondition, other.currentCondition, t)!,
      currentHighLowTemperature: TextStyle.lerp(currentHighLowTemperature, other.currentHighLowTemperature, t)!,
      dayTitle: TextStyle.lerp(dayTitle, other.dayTitle, t)!,
      dayHighLowTemperature: TextStyle.lerp(dayHighLowTemperature, other.dayHighLowTemperature, t)!,
      dayCondition: TextStyle.lerp(dayCondition, other.dayCondition, t)!,
      chartTitle: TextStyle.lerp(chartTitle, other.chartTitle, t)!,
      chartTemperature: TextStyle.lerp(chartTemperature, other.chartTemperature, t)!,
      locationsTextField: TextStyle.lerp(locationsTextField, other.locationsTextField, t)!,
      locationsTitle: TextStyle.lerp(locationsTitle, other.locationsTitle, t)!,
      locationsName: TextStyle.lerp(locationsName, other.locationsName, t)!,
      locationsCountry: TextStyle.lerp(locationsCountry, other.locationsCountry, t)!,
      locationsNoLocation: TextStyle.lerp(locationsNoLocation, other.locationsNoLocation, t)!,
      locationsAppName: TextStyle.lerp(locationsAppName, other.locationsAppName, t)!,
      locationsAppVersion: TextStyle.lerp(locationsAppVersion, other.locationsAppVersion, t)!,
      weatherAdditionalValue: TextStyle.lerp(weatherAdditionalValue, other.weatherAdditionalValue, t)!,
      weatherAdditionalSmallValue: TextStyle.lerp(weatherAdditionalSmallValue, other.weatherAdditionalSmallValue, t)!,
      weatherAdditionalTitle: TextStyle.lerp(weatherAdditionalTitle, other.weatherAdditionalTitle, t)!,
    );
  }
}
