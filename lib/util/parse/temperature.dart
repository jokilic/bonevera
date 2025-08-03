/// Returns `temperature` in proper format
String getTemperatureString(double? passedTemperature) {
  if (passedTemperature != null) {
    final temperature = passedTemperature.round();
    return '$temperature';
  }
  return '--';
}
