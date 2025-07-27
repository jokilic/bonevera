import 'package:flutter/material.dart';

import 'colors.dart';
import 'text_styles.dart';

class CJVnkTheme {
  ///
  /// LIGHT
  ///

  static ThemeData get light {
    final defaultTheme = ThemeData.light();

    return defaultTheme.copyWith(
      scaffoldBackgroundColor: lightAppColors.accent,
      extensions: [
        lightAppColors,
        lightTextTheme,
      ],
    );
  }

  static final lightAppColors = CJVnkColorsExtension(
    background: CJVnkColors.white,
    primary: CJVnkColors.black,
    accent: CJVnkColors.blue,
  );

  static final lightTextTheme = CJVnkTextThemesExtension(
    currentLocation: CJVnkTextStyles.currentLocation.copyWith(
      color: lightAppColors.primary,
    ),
    currentTemperature: CJVnkTextStyles.currentTemperature.copyWith(
      color: lightAppColors.primary,
    ),
    currentCondition: CJVnkTextStyles.currentCondition.copyWith(
      color: lightAppColors.primary,
    ),
    currentHighLowTemperature: CJVnkTextStyles.currentHighLowTemperature.copyWith(
      color: lightAppColors.primary,
    ),
    currentDayTitle: CJVnkTextStyles.currentDayTitle.copyWith(
      color: lightAppColors.background,
    ),
    currentDayHighLowTemperature: CJVnkTextStyles.currentDayHighLowTemperature.copyWith(
      color: lightAppColors.background,
    ),
    currentDayCondition: CJVnkTextStyles.currentDayCondition.copyWith(
      color: lightAppColors.background.withValues(alpha: 0.6),
    ),
    currentHourChartTitle: CJVnkTextStyles.currentHourChartTitle.copyWith(
      color: lightAppColors.background,
    ),
    currentHourChartTemperature: CJVnkTextStyles.currentHourChartTemperature.copyWith(
      color: lightAppColors.background,
    ),
    locationsAppName: CJVnkTextStyles.locationsAppName.copyWith(
      color: lightAppColors.background,
    ),
    locationsAppVersion: CJVnkTextStyles.locationsAppVersion.copyWith(
      color: lightAppColors.background,
    ),
  );
}

extension CJVnkThemeExtension on ThemeData {
  CJVnkColorsExtension get cJVnkColors => extension<CJVnkColorsExtension>() ?? CJVnkTheme.lightAppColors;
  CJVnkTextThemesExtension get cJVnkTextStyles => extension<CJVnkTextThemesExtension>() ?? CJVnkTheme.lightTextTheme;
}

extension ThemeGetter on BuildContext {
  ThemeData get theme => Theme.of(this);
  CJVnkColorsExtension get colors => theme.cJVnkColors;
  CJVnkTextThemesExtension get textStyles => theme.cJVnkTextStyles;
}
