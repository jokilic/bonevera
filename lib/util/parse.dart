import '../constants/enums.dart';
import '../models/day.dart';
import '../theme/icons.dart';

/// Returns `temperature` in proper format
String getTemperatureString(double? passedTemperature) {
  if (passedTemperature != null) {
    final temperature = passedTemperature.toStringAsFixed(0);
    return '$temperature°';
  }
  return '--';
}

/// Returns proper image, depending on [ConditionCode] and `daylight` boolean
String getConditionImage({
  required ConditionCode? passedConditionCode,
  required bool daylight,
}) {
  if (passedConditionCode != null) {
    return switch (passedConditionCode) {
      ConditionCode.BlowingDust => daylight ? CJVnkIcons.sunCloudFastWind : CJVnkIcons.moonCloudFastWind,
      ConditionCode.Clear => daylight ? CJVnkIcons.sun : CJVnkIcons.moonStars,
      ConditionCode.Cloudy => daylight ? CJVnkIcons.cloud : CJVnkIcons.moonCloud,
      ConditionCode.Foggy => daylight ? CJVnkIcons.sunCloudSlowWind : CJVnkIcons.moonCloudSlowWind,
      ConditionCode.Haze => daylight ? CJVnkIcons.sunCloudSlowWind : CJVnkIcons.moonCloudSlowWind,
      ConditionCode.MostlyClear => daylight ? CJVnkIcons.sunCloud : CJVnkIcons.moonCloud,
      ConditionCode.MostlyCloudy => daylight ? CJVnkIcons.cloudSunset : CJVnkIcons.moonCloud,
      ConditionCode.PartlyCloudy => daylight ? CJVnkIcons.sunCloud : CJVnkIcons.moonCloud,
      ConditionCode.Smoky => daylight ? CJVnkIcons.sunCloud : CJVnkIcons.moonCloud,
      ConditionCode.Breezy => daylight ? CJVnkIcons.sunSlowWind : CJVnkIcons.moonSlowWind,
      ConditionCode.Windy => daylight ? CJVnkIcons.sunFastWind : CJVnkIcons.moonFastWind,
      ConditionCode.Drizzle => daylight ? CJVnkIcons.sunCloudLittleRain : CJVnkIcons.moonCloudLittleRain,
      ConditionCode.HeavyRain => daylight ? CJVnkIcons.sunCloudBigRain : CJVnkIcons.moonCloudBigRain,
      ConditionCode.IsolatedThunderstorms => daylight ? CJVnkIcons.sunCloudZap : CJVnkIcons.moonCloudZap,
      ConditionCode.Rain => daylight ? CJVnkIcons.sunCloudMidRain : CJVnkIcons.moonCloudMidRain,
      ConditionCode.SunShowers => daylight ? CJVnkIcons.sunCloudAngledRain : CJVnkIcons.moonCloudAngledRain,
      ConditionCode.ScatteredThunderstorms => daylight ? CJVnkIcons.sunCloudZap : CJVnkIcons.moonCloudZap,
      ConditionCode.StrongStorms => daylight ? CJVnkIcons.cloud3Zaps : CJVnkIcons.moonCloudZap,
      ConditionCode.Thunderstorms => daylight ? CJVnkIcons.cloudZap : CJVnkIcons.moonCloudZap,
      ConditionCode.Frigid => daylight ? CJVnkIcons.midSnowSlowWinds : CJVnkIcons.moonCloudMidSnow,
      ConditionCode.Hail => daylight ? CJVnkIcons.sunCloudHailstone : CJVnkIcons.moonCloudHailstone,
      ConditionCode.Hot => daylight ? CJVnkIcons.sunFastWind : CJVnkIcons.sunFastWind,
      ConditionCode.Flurries => daylight ? CJVnkIcons.sunCloudLittleSnow : CJVnkIcons.moonCloudLittleSnow,
      ConditionCode.Sleet => daylight ? CJVnkIcons.cloudLittleSnow : CJVnkIcons.moonCloudLittleSnow,
      ConditionCode.Snow => daylight ? CJVnkIcons.cloudMidSnow : CJVnkIcons.moonCloudMidSnow,
      ConditionCode.SunFlurries => daylight ? CJVnkIcons.sunCloudLittleSnow : CJVnkIcons.moonCloudLittleSnow,
      ConditionCode.WintryMix => daylight ? CJVnkIcons.bigSnowLittleSnow : CJVnkIcons.moonCloudMidSnow,
      ConditionCode.Blizzard => daylight ? CJVnkIcons.midSnowFastWinds : CJVnkIcons.moonCloudSnow,
      ConditionCode.BlowingSnow => daylight ? CJVnkIcons.cloudFastWind : CJVnkIcons.moonCloudFastWind,
      ConditionCode.FreezingDrizzle => daylight ? CJVnkIcons.cloudLittleSnow : CJVnkIcons.moonCloudLittleSnow,
      ConditionCode.FreezingRain => daylight ? CJVnkIcons.cloudMidRain : CJVnkIcons.moonCloudMidRain,
      ConditionCode.HeavySnow => daylight ? CJVnkIcons.bigSnow : CJVnkIcons.moonCloudSnow,
      ConditionCode.Hurricane => daylight ? CJVnkIcons.fastWindsZaps : CJVnkIcons.fastWindsZaps,
      ConditionCode.TropicalStorm => daylight ? CJVnkIcons.cloudAngledRainZap : CJVnkIcons.moonCloudAngledRain,
    };
  }
  return CJVnkIcons.tornado;
}

/// Returns current [Day] from a [List<Day>]
Day? getCurrentDay(List<Day>? days) {
  final now = DateTime.now().toUtc();

  try {
    return days?.firstWhere(
      (day) => now.isAfter(day.forecastStart) && now.isBefore(day.forecastEnd),
    );
  } catch (_) {
    return null;
  }
}
