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
