import 'package:flutter/material.dart';

import 'colors.dart';
import 'text_styles.dart';

class CJVnkTheme {
  ///
  /// LIGHT BLUE
  ///

  static ThemeData get lightBlue {
    final defaultTheme = ThemeData.light();

    return defaultTheme.copyWith(
      extensions: [
        lightBlueAppColors,
        lightBlueTextTheme,
      ],
    );
  }

  static final lightBlueAppColors = CJVnkColorsExtension(
    weatherBackground: CJVnkColors.blue,
    appBarDaysBackground: CJVnkColors.white.withValues(alpha: 0.25),
    bottomWidgetBackground: CJVnkColors.black,
    locationsBackground: CJVnkColors.black,
    appBarText: CJVnkColors.black,
    mainWeatherText: CJVnkColors.black,
    daysWidgetText: CJVnkColors.white,
    bottomWidgetText: CJVnkColors.white,
    locationsText: CJVnkColors.white,
  );

  static final lightBlueTextTheme = CJVnkTextThemesExtension(
    currentLocation: CJVnkTextStyles.currentLocation.copyWith(
      color: lightBlueAppColors.appBarText,
    ),
    currentTemperature: CJVnkTextStyles.currentTemperature.copyWith(
      color: lightBlueAppColors.mainWeatherText,
    ),
    currentCondition: CJVnkTextStyles.currentCondition.copyWith(
      color: lightBlueAppColors.mainWeatherText,
    ),
    currentHighLowTemperature: CJVnkTextStyles.currentHighLowTemperature.copyWith(
      color: lightBlueAppColors.mainWeatherText,
    ),
    dayTitle: CJVnkTextStyles.dayTitle.copyWith(
      color: lightBlueAppColors.daysWidgetText,
    ),
    dayHighLowTemperature: CJVnkTextStyles.dayHighLowTemperature.copyWith(
      color: lightBlueAppColors.daysWidgetText,
    ),
    dayCondition: CJVnkTextStyles.dayCondition.copyWith(
      color: lightBlueAppColors.daysWidgetText.withValues(alpha: 0.6),
    ),
    chartTitle: CJVnkTextStyles.chartTitle.copyWith(
      color: lightBlueAppColors.bottomWidgetText,
    ),
    chartTemperature: CJVnkTextStyles.chartTemperature.copyWith(
      color: lightBlueAppColors.bottomWidgetText,
    ),
    locationsTextField: CJVnkTextStyles.locationsTextField.copyWith(
      color: lightBlueAppColors.locationsText,
    ),
    locationsTitle: CJVnkTextStyles.locationsTitle.copyWith(
      color: lightBlueAppColors.locationsText,
    ),
    locationsName: CJVnkTextStyles.locationsName.copyWith(
      color: lightBlueAppColors.locationsText,
    ),
    locationsCountry: CJVnkTextStyles.locationsCountry.copyWith(
      color: lightBlueAppColors.locationsText,
    ),
    locationsNoLocation: CJVnkTextStyles.locationsNoLocation.copyWith(
      color: lightBlueAppColors.locationsText,
    ),
    locationsAppName: CJVnkTextStyles.locationsAppName.copyWith(
      color: lightBlueAppColors.locationsText,
    ),
    locationsAppVersion: CJVnkTextStyles.locationsAppVersion.copyWith(
      color: lightBlueAppColors.locationsText,
    ),
    weatherAdditionalValue: CJVnkTextStyles.weatherAdditionalValue.copyWith(
      color: lightBlueAppColors.bottomWidgetText,
    ),
    weatherAdditionalSmallValue: CJVnkTextStyles.weatherAdditionalSmallValue.copyWith(
      color: lightBlueAppColors.bottomWidgetText.withValues(alpha: 0.6),
    ),
    weatherAdditionalTitle: CJVnkTextStyles.weatherAdditionalTitle.copyWith(
      color: lightBlueAppColors.bottomWidgetText.withValues(alpha: 0.6),
    ),
  );
}

extension CJVnkThemeExtension on ThemeData {
  CJVnkColorsExtension get cJVnkColors => extension<CJVnkColorsExtension>() ?? CJVnkTheme.lightBlueAppColors;
  CJVnkTextThemesExtension get cJVnkTextStyles => extension<CJVnkTextThemesExtension>() ?? CJVnkTheme.lightBlueTextTheme;
}

extension ThemeGetter on BuildContext {
  ThemeData get theme => Theme.of(this);
  CJVnkColorsExtension get colors => theme.cJVnkColors;
  CJVnkTextThemesExtension get textStyles => theme.cJVnkTextStyles;
}
