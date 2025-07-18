import 'package:flutter/foundation.dart';

import 'hour.dart';

class ForecastHourly {
  final List<Hour> hours;

  ForecastHourly({
    required this.hours,
  });

  factory ForecastHourly.fromMap(Map<String, dynamic> map) => ForecastHourly(
    hours: List<Hour>.from(
      (map['hours'] as List).map<Hour>(
        (x) => Hour.fromMap(x as Map<String, dynamic>),
      ),
    ),
  );

  @override
  String toString() => 'ForecastHourly(hours: $hours)';

  @override
  bool operator ==(covariant ForecastHourly other) {
    if (identical(this, other)) {
      return true;
    }

    return listEquals(other.hours, hours);
  }

  @override
  int get hashCode => hours.hashCode;
}
