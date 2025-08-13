import 'package:flutter/material.dart';

import 'colors.dart';
import 'text_styles.dart';

class BoneveraTheme {
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

  static final lightBlueAppColors = BoneveraColorsExtension(
    weatherBackground: BoneveraColors.lightBlue,
    appBarDaysBackground: BoneveraColors.white.withValues(alpha: 0.25),
    bottomWidgetBackground: BoneveraColors.darkPurple,
    locationsBackground: BoneveraColors.darkPurple,
    appBarText: BoneveraColors.darkPurple,
    mainWeatherText: BoneveraColors.darkPurple,
    daysWidgetText: BoneveraColors.white,
    bottomWidgetText: BoneveraColors.white,
    locationsText: BoneveraColors.white,
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

  static final darkAppColors = BoneveraColorsExtension(
    weatherBackground: BoneveraColors.darkPurple,
    appBarDaysBackground: BoneveraColors.white.withValues(alpha: 0.1),
    bottomWidgetBackground: BoneveraColors.lightBlue,
    locationsBackground: BoneveraColors.lightBlue,
    appBarText: BoneveraColors.white,
    mainWeatherText: BoneveraColors.white,
    daysWidgetText: BoneveraColors.white,
    bottomWidgetText: BoneveraColors.white,
    locationsText: BoneveraColors.white,
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

  static final whiteAppColors = BoneveraColorsExtension(
    weatherBackground: BoneveraColors.white,
    appBarDaysBackground: Colors.white,
    bottomWidgetBackground: BoneveraColors.lightBlue,
    locationsBackground: BoneveraColors.lightBlue,
    appBarText: BoneveraColors.darkPurple,
    mainWeatherText: BoneveraColors.darkPurple,
    daysWidgetText: BoneveraColors.darkPurple,
    bottomWidgetText: BoneveraColors.white,
    locationsText: BoneveraColors.darkPurple,
  );

  static final whiteTextTheme = getTextThemesExtension(
    colorsExtension: whiteAppColors,
  );
}

extension BoneveraThemeExtension on ThemeData {
  BoneveraColorsExtension get boneveraColors => extension<BoneveraColorsExtension>() ?? BoneveraTheme.lightBlueAppColors;
  BoneveraTextThemesExtension get boneveraTextStyles => extension<BoneveraTextThemesExtension>() ?? BoneveraTheme.lightBlueTextTheme;
}

extension ThemeGetter on BuildContext {
  ThemeData get theme => Theme.of(this);
  BoneveraColorsExtension get colors => theme.boneveraColors;
  BoneveraTextThemesExtension get textStyles => theme.boneveraTextStyles;
}

BoneveraTextThemesExtension getTextThemesExtension({
  required BoneveraColorsExtension colorsExtension,
}) => BoneveraTextThemesExtension(
  appBarTitle: BoneveraTextStyles.appBarTitle.copyWith(
    color: colorsExtension.appBarText,
  ),
  appBarSubtitle: BoneveraTextStyles.appBarSubtitle.copyWith(
    color: colorsExtension.appBarText,
  ),
  currentTemperature: BoneveraTextStyles.currentTemperature.copyWith(
    color: colorsExtension.mainWeatherText,
  ),
  currentCondition: BoneveraTextStyles.currentCondition.copyWith(
    color: colorsExtension.mainWeatherText,
  ),
  currentHighLowTemperature: BoneveraTextStyles.currentHighLowTemperature.copyWith(
    color: colorsExtension.mainWeatherText,
  ),
  dayTemperatureHighLow: BoneveraTextStyles.dayTemperatureHighLow.copyWith(
    color: colorsExtension.mainWeatherText,
  ),
  dayTitle: BoneveraTextStyles.dayTitle.copyWith(
    color: colorsExtension.daysWidgetText,
  ),
  dayHighLowTemperature: BoneveraTextStyles.dayHighLowTemperature.copyWith(
    color: colorsExtension.daysWidgetText,
  ),
  dayCondition: BoneveraTextStyles.dayCondition.copyWith(
    color: colorsExtension.daysWidgetText.withValues(alpha: 0.6),
  ),
  chartTitle: BoneveraTextStyles.chartTitle.copyWith(
    color: colorsExtension.bottomWidgetText,
  ),
  chartTemperature: BoneveraTextStyles.chartTemperature.copyWith(
    color: colorsExtension.bottomWidgetText,
  ),
  locationsTextField: BoneveraTextStyles.locationsTextField.copyWith(
    color: colorsExtension.locationsText,
  ),
  locationsTitle: BoneveraTextStyles.locationsTitle.copyWith(
    color: colorsExtension.locationsText,
  ),
  locationsName: BoneveraTextStyles.locationsName.copyWith(
    color: colorsExtension.locationsText,
  ),
  locationsCountry: BoneveraTextStyles.locationsCountry.copyWith(
    color: colorsExtension.locationsText,
  ),
  locationsNoLocation: BoneveraTextStyles.locationsNoLocation.copyWith(
    color: colorsExtension.locationsText,
  ),
  locationsAppName: BoneveraTextStyles.locationsAppName.copyWith(
    color: colorsExtension.locationsText,
  ),
  locationsAppVersion: BoneveraTextStyles.locationsAppVersion.copyWith(
    color: colorsExtension.locationsText,
  ),
  weatherAdditionalValue: BoneveraTextStyles.weatherAdditionalValue.copyWith(
    color: colorsExtension.bottomWidgetText,
  ),
  weatherAdditionalSmallValue: BoneveraTextStyles.weatherAdditionalSmallValue.copyWith(
    color: colorsExtension.bottomWidgetText.withValues(alpha: 0.6),
  ),
  weatherAdditionalTitle: BoneveraTextStyles.weatherAdditionalTitle.copyWith(
    color: colorsExtension.bottomWidgetText.withValues(alpha: 0.6),
  ),
);
