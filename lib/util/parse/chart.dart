/// Returns the `index` of the `List` which is closest to `target`
int findClosestIndex({
  required List<double> values,
  required double target,
}) {
  final initialIndex = values.indexWhere((t) => t == target);

  if (initialIndex != -1) {
    return initialIndex;
  } else {
    var minDiff = double.infinity;
    var closestIndex = 0;

    for (var i = 0; i < values.length; i++) {
      final diff = (values[i] - target).abs();

      if (diff < minDiff) {
        minDiff = diff;
        closestIndex = i;
      }
    }

    return closestIndex;
  }
}
