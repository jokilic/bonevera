/// Returns `pressure` in proper format
String getPressureString(double? passedPressure) {
  if (passedPressure != null) {
    final pressure = passedPressure.round();
    return '$pressure';
  }
  return '--';
}
