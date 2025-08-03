import 'package:flutter/material.dart';

abstract class CJVnkColors {
  static const white = Color(0xFFDFECFB);
  static const black = Color(0xFF342464);
  static const blue = Color(0xFF74AEDE);
}

class CJVnkColorsExtension extends ThemeExtension<CJVnkColorsExtension> {
  final Color weatherBackground;
  final Color appBarDaysBackground;
  final Color bottomWidgetBackground;
  final Color locationsBackground;

  final Color appBarText;
  final Color mainWeatherText;
  final Color daysWidgetText;
  final Color bottomWidgetText;
  final Color locationsText;

  CJVnkColorsExtension({
    required this.weatherBackground,
    required this.appBarDaysBackground,
    required this.bottomWidgetBackground,
    required this.locationsBackground,
    required this.appBarText,
    required this.mainWeatherText,
    required this.daysWidgetText,
    required this.bottomWidgetText,
    required this.locationsText,
  });

  @override
  ThemeExtension<CJVnkColorsExtension> copyWith({
    Color? weatherBackground,
    Color? appBarDaysBackground,
    Color? bottomWidgetBackground,
    Color? locationsBackground,
    Color? appBarText,
    Color? mainWeatherText,
    Color? daysWidgetText,
    Color? bottomWidgetText,
    Color? locationsText,
  }) => CJVnkColorsExtension(
    weatherBackground: weatherBackground ?? this.weatherBackground,
    appBarDaysBackground: appBarDaysBackground ?? this.appBarDaysBackground,
    bottomWidgetBackground: bottomWidgetBackground ?? this.bottomWidgetBackground,
    locationsBackground: locationsBackground ?? this.locationsBackground,
    appBarText: appBarText ?? this.appBarText,
    mainWeatherText: mainWeatherText ?? this.mainWeatherText,
    daysWidgetText: daysWidgetText ?? this.daysWidgetText,
    bottomWidgetText: bottomWidgetText ?? this.bottomWidgetText,
    locationsText: locationsText ?? this.locationsText,
  );

  @override
  ThemeExtension<CJVnkColorsExtension> lerp(
    covariant ThemeExtension<CJVnkColorsExtension>? other,
    double t,
  ) {
    if (other is! CJVnkColorsExtension) {
      return this;
    }

    return CJVnkColorsExtension(
      weatherBackground: Color.lerp(weatherBackground, other.weatherBackground, t)!,
      appBarDaysBackground: Color.lerp(appBarDaysBackground, other.appBarDaysBackground, t)!,
      bottomWidgetBackground: Color.lerp(bottomWidgetBackground, other.bottomWidgetBackground, t)!,
      locationsBackground: Color.lerp(locationsBackground, other.locationsBackground, t)!,
      appBarText: Color.lerp(appBarText, other.appBarText, t)!,
      mainWeatherText: Color.lerp(mainWeatherText, other.mainWeatherText, t)!,
      daysWidgetText: Color.lerp(daysWidgetText, other.daysWidgetText, t)!,
      bottomWidgetText: Color.lerp(bottomWidgetText, other.bottomWidgetText, t)!,
      locationsText: Color.lerp(locationsText, other.locationsText, t)!,
    );
  }
}
