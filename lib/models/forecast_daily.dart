import 'package:flutter/foundation.dart';

import 'day.dart';

class ForecastDaily {
  final List<Day> days;

  ForecastDaily({
    required this.days,
  });

  factory ForecastDaily.fromMap(Map<String, dynamic> map) => ForecastDaily(
    days: List<Day>.from(
      (map['days'] as List).map<Day>(
        (x) => Day.fromMap(x as Map<String, dynamic>),
      ),
    ),
  );

  @override
  String toString() => 'ForecastDaily(days: $days)';

  @override
  bool operator ==(covariant ForecastDaily other) {
    if (identical(this, other)) {
      return true;
    }

    return listEquals(other.days, days);
  }

  @override
  int get hashCode => days.hashCode;
}
