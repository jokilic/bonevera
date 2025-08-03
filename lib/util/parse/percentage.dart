/// Returns `percentage` in proper format
String getPercentageString(double? passedValue) {
  if (passedValue != null) {
    final percentage = (passedValue * 100).round();
    return '$percentage';
  }
  return '--';
}
