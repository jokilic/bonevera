import 'package:flutter/foundation.dart' show listEquals;

import 'metadata.dart';
import 'minute.dart';
import 'summary.dart';

class ForecastNextHour {
  final String name;
  final Metadata metadata;
  final List<Summary> summary;
  final DateTime forecastStart;
  final DateTime forecastEnd;
  final List<Minute> minutes;

  ForecastNextHour({
    required this.name,
    required this.metadata,
    required this.summary,
    required this.forecastStart,
    required this.forecastEnd,
    required this.minutes,
  });

  factory ForecastNextHour.fromMap(Map<String, dynamic> map) => ForecastNextHour(
    name: map['name'] as String,
    metadata: Metadata.fromMap(map['metadata'] as Map<String, dynamic>),
    summary: List<Summary>.from(
      (map['summary'] as List).map<Summary>(
        (x) => Summary.fromMap(x as Map<String, dynamic>),
      ),
    ),
    forecastStart: DateTime.parse(map['forecastStart'] as String),
    forecastEnd: DateTime.parse(map['forecastEnd'] as String),
    minutes: List<Minute>.from(
      (map['minutes'] as List).map<Minute>(
        (x) => Minute.fromMap(x as Map<String, dynamic>),
      ),
    ),
  );

  @override
  String toString() => 'ForecastNextHour(name: $name, metadata: $metadata, summary: $summary, forecastStart:  $forecastStart, forecastEnd: $forecastEnd, minutes: $minutes)';

  @override
  bool operator ==(covariant ForecastNextHour other) {
    if (identical(this, other)) {
      return true;
    }

    return other.name == name &&
        other.metadata == metadata &&
        listEquals(other.summary, summary) &&
        other.forecastStart == forecastStart &&
        other.forecastEnd == forecastEnd &&
        listEquals(other.minutes, minutes);
  }

  @override
  int get hashCode => name.hashCode ^ metadata.hashCode ^ summary.hashCode ^ forecastStart.hashCode ^ forecastEnd.hashCode ^ minutes.hashCode;
}
