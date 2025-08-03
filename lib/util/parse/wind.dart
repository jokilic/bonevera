/// Returns `wind direction` in proper format
String getWindDirectionString(int? passedWindDirection) {
  if (passedWindDirection != null) {
    const directions = ['N', 'NNE', 'NE', 'ENE', 'E', 'ESE', 'SE', 'SSE', 'S', 'SSW', 'SW', 'WSW', 'W', 'WNW', 'NW', 'NNW'];
    final index = ((passedWindDirection % 360) / 22.5).round() % directions.length;
    return directions[index];
  }
  return '--';
}

/// Returns `wind speed` in proper format
String getWindSpeedString(double? passedWindSpeed) {
  if (passedWindSpeed != null) {
    final speed = passedWindSpeed.round();
    return '$speed';
  }
  return '--';
}
