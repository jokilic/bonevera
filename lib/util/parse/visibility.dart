/// Returns `visibility` in proper format
String getVisibilityString(double? passedVisiblity) {
  if (passedVisiblity != null) {
    final visibility = (passedVisiblity / 1000).round();
    return '$visibility';
  }
  return '--';
}
