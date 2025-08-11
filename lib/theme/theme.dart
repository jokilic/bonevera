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
    weatherBackground: CJVnkColors.lightBlue,
    appBarDaysBackground: CJVnkColors.white.withValues(alpha: 0.25),
    bottomWidgetBackground: CJVnkColors.darkPurple,
    locationsBackground: CJVnkColors.darkPurple,
    appBarText: CJVnkColors.darkPurple,
    mainWeatherText: CJVnkColors.darkPurple,
    daysWidgetText: CJVnkColors.white,
    bottomWidgetText: CJVnkColors.white,
    locationsText: CJVnkColors.white,
  );

  static final lightBlueTextTheme = getTextThemesExtension(
    colorsExtension: lightBlueAppColors,
  );

  ///
  /// DARK
  ///

  static ThemeData get dark {
    final defaultTheme = ThemeData.dark();

    return defaultTheme.copyWith(
      extensions: [
        darkAppColors,
        darkTextTheme,
      ],
    );
  }

  static final darkAppColors = CJVnkColorsExtension(
    weatherBackground: CJVnkColors.darkPurple,
    appBarDaysBackground: CJVnkColors.white.withValues(alpha: 0.1),
    bottomWidgetBackground: CJVnkColors.lightBlue,
    locationsBackground: CJVnkColors.lightBlue,
    appBarText: CJVnkColors.white,
    mainWeatherText: CJVnkColors.white,
    daysWidgetText: CJVnkColors.white,
    bottomWidgetText: CJVnkColors.white,
    locationsText: CJVnkColors.white,
  );

  static final darkTextTheme = getTextThemesExtension(
    colorsExtension: darkAppColors,
  );

  ///
  /// WHITE
  ///

  static ThemeData get white {
    final defaultTheme = ThemeData.light();

    return defaultTheme.copyWith(
      extensions: [
        whiteAppColors,
        whiteTextTheme,
      ],
    );
  }

  static final whiteAppColors = CJVnkColorsExtension(
    weatherBackground: CJVnkColors.white,
    appBarDaysBackground: Colors.white,
    bottomWidgetBackground: CJVnkColors.lightBlue,
    locationsBackground: CJVnkColors.lightBlue,
    appBarText: CJVnkColors.darkPurple,
    mainWeatherText: CJVnkColors.darkPurple,
    daysWidgetText: CJVnkColors.darkPurple,
    bottomWidgetText: CJVnkColors.white,
    locationsText: CJVnkColors.darkPurple,
  );

  static final whiteTextTheme = getTextThemesExtension(
    colorsExtension: whiteAppColors,
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

CJVnkTextThemesExtension getTextThemesExtension({
  required CJVnkColorsExtension colorsExtension,
}) => CJVnkTextThemesExtension(
  appBarTitle: CJVnkTextStyles.appBarTitle.copyWith(
    color: colorsExtension.appBarText,
  ),
  appBarSubtitle: CJVnkTextStyles.appBarSubtitle.copyWith(
    color: colorsExtension.appBarText,
  ),
  currentTemperature: CJVnkTextStyles.currentTemperature.copyWith(
    color: colorsExtension.mainWeatherText,
  ),
  currentCondition: CJVnkTextStyles.currentCondition.copyWith(
    color: colorsExtension.mainWeatherText,
  ),
  currentHighLowTemperature: CJVnkTextStyles.currentHighLowTemperature.copyWith(
    color: colorsExtension.mainWeatherText,
  ),
  dayTitle: CJVnkTextStyles.dayTitle.copyWith(
    color: colorsExtension.daysWidgetText,
  ),
  dayHighLowTemperature: CJVnkTextStyles.dayHighLowTemperature.copyWith(
    color: colorsExtension.daysWidgetText,
  ),
  dayCondition: CJVnkTextStyles.dayCondition.copyWith(
    color: colorsExtension.daysWidgetText.withValues(alpha: 0.6),
  ),
  chartTitle: CJVnkTextStyles.chartTitle.copyWith(
    color: colorsExtension.bottomWidgetText,
  ),
  chartTemperature: CJVnkTextStyles.chartTemperature.copyWith(
    color: colorsExtension.bottomWidgetText,
  ),
  locationsTextField: CJVnkTextStyles.locationsTextField.copyWith(
    color: colorsExtension.locationsText,
  ),
  locationsTitle: CJVnkTextStyles.locationsTitle.copyWith(
    color: colorsExtension.locationsText,
  ),
  locationsName: CJVnkTextStyles.locationsName.copyWith(
    color: colorsExtension.locationsText,
  ),
  locationsCountry: CJVnkTextStyles.locationsCountry.copyWith(
    color: colorsExtension.locationsText,
  ),
  locationsNoLocation: CJVnkTextStyles.locationsNoLocation.copyWith(
    color: colorsExtension.locationsText,
  ),
  locationsAppName: CJVnkTextStyles.locationsAppName.copyWith(
    color: colorsExtension.locationsText,
  ),
  locationsAppVersion: CJVnkTextStyles.locationsAppVersion.copyWith(
    color: colorsExtension.locationsText,
  ),
  weatherAdditionalValue: CJVnkTextStyles.weatherAdditionalValue.copyWith(
    color: colorsExtension.bottomWidgetText,
  ),
  weatherAdditionalSmallValue: CJVnkTextStyles.weatherAdditionalSmallValue.copyWith(
    color: colorsExtension.bottomWidgetText.withValues(alpha: 0.6),
  ),
  weatherAdditionalTitle: CJVnkTextStyles.weatherAdditionalTitle.copyWith(
    color: colorsExtension.bottomWidgetText.withValues(alpha: 0.6),
  ),
);
