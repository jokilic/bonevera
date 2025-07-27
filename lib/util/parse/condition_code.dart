import '../../constants/enums.dart';
import '../../theme/icons.dart';

/// Returns proper text, depending on [ConditionCode] and `daylight` boolean
String getConditionString({
  required ConditionCode? passedConditionCode,
  required bool daylight,
}) {
  if (passedConditionCode != null) {
    return switch (passedConditionCode) {
      ConditionCode.BlowingDust => 'Blowing dust',
      ConditionCode.Clear => 'Clear',
      ConditionCode.Cloudy => 'Cloudy',
      ConditionCode.Foggy => 'Foggy',
      ConditionCode.Haze => 'Hazy',
      ConditionCode.MostlyClear => 'Mostly clear',
      ConditionCode.MostlyCloudy => 'Mostly cloudy',
      ConditionCode.PartlyCloudy => 'Partly cloudy',
      ConditionCode.Smoky => 'Smoky',
      ConditionCode.Breezy => 'Breezy',
      ConditionCode.Windy => 'Windy',
      ConditionCode.Drizzle => 'Drizzle',
      ConditionCode.HeavyRain => 'Heavy rain',
      ConditionCode.IsolatedThunderstorms => 'Isolated thunderstorms',
      ConditionCode.Rain => 'Rain',
      ConditionCode.SunShowers => 'Sun showers',
      ConditionCode.ScatteredThunderstorms => 'Scattered thunderstorms',
      ConditionCode.StrongStorms => 'Strong storms',
      ConditionCode.Thunderstorms => 'Thunderstorms',
      ConditionCode.Frigid => 'Frigid',
      ConditionCode.Hail => 'Hail',
      ConditionCode.Hot => 'Hot',
      ConditionCode.Flurries => 'Flurries',
      ConditionCode.Sleet => 'Sleet',
      ConditionCode.Snow => 'Snow',
      ConditionCode.SunFlurries => 'Sun flurries',
      ConditionCode.WintryMix => 'Wintry mix',
      ConditionCode.Blizzard => 'Blizzard',
      ConditionCode.BlowingSnow => 'Blowing snow',
      ConditionCode.FreezingDrizzle => 'Freezing drizzle',
      ConditionCode.FreezingRain => 'Freezing rain',
      ConditionCode.HeavySnow => 'Heavy snow',
      ConditionCode.Hurricane => 'Hurricane',
      ConditionCode.TropicalStorm => 'Tropical storm',
    };
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
