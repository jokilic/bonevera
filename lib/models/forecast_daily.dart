import 'package:flutter/foundation.dart';

import 'day.dart';
import 'metadata.dart';

class ForecastDaily {
  final String name;
  final Metadata metadata;
  final List<Day> days;

  ForecastDaily({
    required this.name,
    required this.metadata,
    required this.days,
  });

  factory ForecastDaily.fromMap(Map<String, dynamic> map) => ForecastDaily(
    name: map['name'] as String,
    metadata: Metadata.fromMap(map['metadata'] as Map<String, dynamic>),
    days: List<Day>.from(
      (map['days'] as List).map<Day>(
        (x) => Day.fromMap(x as Map<String, dynamic>),
      ),
    ),
  );

  @override
  String toString() => 'ForecastDaily(name: $name, metadata: $metadata, days: $days)';

  @override
  bool operator ==(covariant ForecastDaily other) {
    if (identical(this, other)) {
      return true;
    }

    return other.name == name && other.metadata == metadata && listEquals(other.days, days);
  }

  @override
  int get hashCode => name.hashCode ^ metadata.hashCode ^ days.hashCode;
}
