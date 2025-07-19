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

  static const todayTitle = TextStyle(
    fontFamily: 'ProductSans',
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  static const todayHighLowTemperature = TextStyle(
    fontFamily: 'ProductSans',
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static const todayCondition = TextStyle(
    fontFamily: 'ProductSans',
    fontSize: 10,
    fontWeight: FontWeight.w700,
  );
}

class CJVnkTextThemesExtension extends ThemeExtension<CJVnkTextThemesExtension> {
  final TextStyle currentLocation;
  final TextStyle currentTemperature;
  final TextStyle currentCondition;
  final TextStyle currentHighLowTemperature;
  final TextStyle todayTitle;
  final TextStyle todayHighLowTemperature;
  final TextStyle todayCondition;

  const CJVnkTextThemesExtension({
    required this.currentLocation,
    required this.currentTemperature,
    required this.currentCondition,
    required this.currentHighLowTemperature,
    required this.todayTitle,
    required this.todayHighLowTemperature,
    required this.todayCondition,
  });

  @override
  ThemeExtension<CJVnkTextThemesExtension> copyWith({
    TextStyle? currentLocation,
    TextStyle? currentTemperature,
    TextStyle? currentCondition,
    TextStyle? currentHighLowTemperature,
    TextStyle? todayTitle,
    TextStyle? todayHighLowTemperature,
    TextStyle? todayCondition,
  }) => CJVnkTextThemesExtension(
    currentLocation: currentLocation ?? this.currentLocation,
    currentTemperature: currentTemperature ?? this.currentTemperature,
    currentCondition: currentCondition ?? this.currentCondition,
    currentHighLowTemperature: currentHighLowTemperature ?? this.currentHighLowTemperature,
    todayTitle: todayTitle ?? this.todayTitle,
    todayHighLowTemperature: todayHighLowTemperature ?? this.todayHighLowTemperature,
    todayCondition: todayCondition ?? this.todayCondition,
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
      todayTitle: TextStyle.lerp(todayTitle, other.todayTitle, t)!,
      todayHighLowTemperature: TextStyle.lerp(todayHighLowTemperature, other.todayHighLowTemperature, t)!,
      todayCondition: TextStyle.lerp(todayCondition, other.todayCondition, t)!,
    );
  }
}
