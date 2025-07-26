/// Returns `temperature` in proper format
String getTemperatureString(double? passedTemperature) {
  if (passedTemperature != null) {
    final temperature = passedTemperature.toStringAsFixed(0);
    return '$temperature°';
  }
  return '--';
}
