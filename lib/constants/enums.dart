// ignore_for_file: constant_identifier_names

enum DataSet {
  /// The current weather for the requested location.
  currentWeather,

  /// The daily forecast for the requested location.
  forecastDaily,

  /// The hourly forecast for the requested location.
  forecastHourly,

  /// The next hour forecast for the requested location.
  forecastNextHour,

  /// Weather alerts for the requested location.
  weatherAlerts,
}

enum UnitsSystem {
  /// The metric system.
  m,
}

enum MoonPhase {
  /// The moon isn’t visible.
  newMoon,

  /// A crescent-shaped sliver of the moon is visible, and increasing in size.
  waxingCrescent,

  /// Approximately half of the moon is visible, and increasing in size.
  firstQuarter,

  /// The entire disc of the moon is visible.
  full,

  /// More than half of the moon is visible, and increasing in size.
  waxingGibbous,

  /// More than half of the moon is visible, and decreasing in size.
  waningGibbous,

  /// Approximately half of the moon is visible, and decreasing in size.
  thirdQuarter,

  /// A crescent-shaped sliver of the moon is visible, and decreasing in size.
  waningCrescent,
}

enum PrecipitationType {
  /// No precipitation is occurring.
  clear,

  /// An unknown type of precipitation is occuring.
  precipitation,

  /// Rain or freezing rain is falling. snow Snow is falling.
  rain,

  /// Sleet or ice pellets are falling. hail Hail is falling.
  sleet,

  /// Winter weather (wintery mix or wintery showers) is falling.
  mixed,
}

enum PressureTrend {
  /// The sea level air pressure is increasing.
  rising,

  /// The sea level air pressure is decreasing.
  falling,

  /// The sea level air pressure is remaining about the same.
  steady,
}

enum ConditionCode {
  /// Blowing dust or sandstorm
  BlowingDust,

  /// Clear
  Clear,

  /// Cloudy, overcast conditions
  Cloudy,

  /// Fog
  Foggy,

  /// Haze
  Haze,

  /// Mostly clear
  MostlyClear,

  /// Mostly cloudy
  MostlyCloudy,

  /// Partly cloudy
  PartlyCloudy,

  /// Smoky
  Smoky,

  /// Breezy, light wind
  Breezy,

  /// Windy
  Windy,

  /// Drizzle or light rain
  Drizzle,

  /// Heavy rain
  HeavyRain,

  /// Thunderstorms covering less than 1/8 of the forecast area
  IsolatedThunderstorms,

  /// Rain
  Rain,

  /// Rain with visible sun
  SunShowers,

  /// Numerous thunderstorms spread across up to 50% of the forecast area
  ScatteredThunderstorms,

  /// Notably strong thunderstorms
  StrongStorms,

  /// Thunderstorms
  Thunderstorms,

  /// Frigid conditions, low temperatures, or ice crystals
  Frigid,

  /// Hail
  Hail,

  /// High temperatures
  Hot,

  /// Flurries or light snow
  Flurries,

  /// Sleet
  Sleet,

  /// Snow
  Snow,

  /// Snow flurries with visible sun
  SunFlurries,

  /// Wintry mix
  WintryMix,

  /// Blizzard
  Blizzard,

  /// Blowing or drifting snow
  BlowingSnow,

  /// Freezing drizzle or light rain
  FreezingDrizzle,

  /// Freezing rain
  FreezingRain,

  /// Heavy snow
  HeavySnow,

  /// Hurricane
  Hurricane,

  /// Tropical storm
  TropicalStorm,
}
