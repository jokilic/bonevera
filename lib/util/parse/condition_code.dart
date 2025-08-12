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
      ConditionCode.BlowingDust => daylight ? BoneveraIcons.sunCloudFastWind : BoneveraIcons.moonCloudFastWind,
      ConditionCode.Clear => daylight ? BoneveraIcons.sun : BoneveraIcons.moonStars,
      ConditionCode.Cloudy => daylight ? BoneveraIcons.cloud : BoneveraIcons.moonCloud,
      ConditionCode.Foggy => daylight ? BoneveraIcons.sunCloudSlowWind : BoneveraIcons.moonCloudSlowWind,
      ConditionCode.Haze => daylight ? BoneveraIcons.sunCloudSlowWind : BoneveraIcons.moonCloudSlowWind,
      ConditionCode.MostlyClear => daylight ? BoneveraIcons.sunCloud : BoneveraIcons.moonCloud,
      ConditionCode.MostlyCloudy => daylight ? BoneveraIcons.cloudSunset : BoneveraIcons.moonCloud,
      ConditionCode.PartlyCloudy => daylight ? BoneveraIcons.sunCloud : BoneveraIcons.moonCloud,
      ConditionCode.Smoky => daylight ? BoneveraIcons.sunCloud : BoneveraIcons.moonCloud,
      ConditionCode.Breezy => daylight ? BoneveraIcons.sunSlowWind : BoneveraIcons.moonSlowWind,
      ConditionCode.Windy => daylight ? BoneveraIcons.sunFastWind : BoneveraIcons.moonFastWind,
      ConditionCode.Drizzle => daylight ? BoneveraIcons.sunCloudLittleRain : BoneveraIcons.moonCloudLittleRain,
      ConditionCode.HeavyRain => daylight ? BoneveraIcons.sunCloudBigRain : BoneveraIcons.moonCloudBigRain,
      ConditionCode.IsolatedThunderstorms => daylight ? BoneveraIcons.sunCloudZap : BoneveraIcons.moonCloudZap,
      ConditionCode.Rain => daylight ? BoneveraIcons.sunCloudMidRain : BoneveraIcons.moonCloudMidRain,
      ConditionCode.SunShowers => daylight ? BoneveraIcons.sunCloudAngledRain : BoneveraIcons.moonCloudAngledRain,
      ConditionCode.ScatteredThunderstorms => daylight ? BoneveraIcons.sunCloudZap : BoneveraIcons.moonCloudZap,
      ConditionCode.StrongStorms => daylight ? BoneveraIcons.cloud3Zaps : BoneveraIcons.moonCloudZap,
      ConditionCode.Thunderstorms => daylight ? BoneveraIcons.cloudZap : BoneveraIcons.moonCloudZap,
      ConditionCode.Frigid => daylight ? BoneveraIcons.midSnowSlowWinds : BoneveraIcons.moonCloudMidSnow,
      ConditionCode.Hail => daylight ? BoneveraIcons.sunCloudHailstone : BoneveraIcons.moonCloudHailstone,
      ConditionCode.Hot => daylight ? BoneveraIcons.sunFastWind : BoneveraIcons.sunFastWind,
      ConditionCode.Flurries => daylight ? BoneveraIcons.sunCloudLittleSnow : BoneveraIcons.moonCloudLittleSnow,
      ConditionCode.Sleet => daylight ? BoneveraIcons.cloudLittleSnow : BoneveraIcons.moonCloudLittleSnow,
      ConditionCode.Snow => daylight ? BoneveraIcons.cloudMidSnow : BoneveraIcons.moonCloudMidSnow,
      ConditionCode.SunFlurries => daylight ? BoneveraIcons.sunCloudLittleSnow : BoneveraIcons.moonCloudLittleSnow,
      ConditionCode.WintryMix => daylight ? BoneveraIcons.bigSnowLittleSnow : BoneveraIcons.moonCloudMidSnow,
      ConditionCode.Blizzard => daylight ? BoneveraIcons.midSnowFastWinds : BoneveraIcons.moonCloudSnow,
      ConditionCode.BlowingSnow => daylight ? BoneveraIcons.cloudFastWind : BoneveraIcons.moonCloudFastWind,
      ConditionCode.FreezingDrizzle => daylight ? BoneveraIcons.cloudLittleSnow : BoneveraIcons.moonCloudLittleSnow,
      ConditionCode.FreezingRain => daylight ? BoneveraIcons.cloudMidRain : BoneveraIcons.moonCloudMidRain,
      ConditionCode.HeavySnow => daylight ? BoneveraIcons.bigSnow : BoneveraIcons.moonCloudSnow,
      ConditionCode.Hurricane => daylight ? BoneveraIcons.fastWindsZaps : BoneveraIcons.fastWindsZaps,
      ConditionCode.TropicalStorm => daylight ? BoneveraIcons.cloudAngledRainZap : BoneveraIcons.moonCloudAngledRain,
    };
  }
  return BoneveraIcons.tornado;
}
