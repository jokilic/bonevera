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
      scaffoldBackgroundColor: lightAppColors.blue,
      extensions: [
        lightAppColors,
        lightTextTheme,
      ],
    );
  }

  static final lightAppColors = CJVnkColorsExtension(
    white: CJVnkColors.white,
    black: CJVnkColors.black,
    blue: CJVnkColors.blue,
  );

  static final lightTextTheme = CJVnkTextThemesExtension(
    currentLocation: CJVnkTextStyles.currentLocation.copyWith(
      color: lightAppColors.black,
    ),
    currentTemperature: CJVnkTextStyles.currentTemperature.copyWith(
      color: lightAppColors.black,
    ),
    currentCondition: CJVnkTextStyles.currentCondition.copyWith(
      color: lightAppColors.black,
    ),
    currentHighLowTemperature: CJVnkTextStyles.currentHighLowTemperature.copyWith(
      color: lightAppColors.black,
    ),
    todayTitle: CJVnkTextStyles.todayTitle.copyWith(
      color: lightAppColors.white,
    ),
    todayHighLowTemperature: CJVnkTextStyles.todayHighLowTemperature.copyWith(
      color: lightAppColors.white,
    ),
    todayCondition: CJVnkTextStyles.todayCondition.copyWith(
      color: lightAppColors.white.withValues(alpha: 0.6),
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
