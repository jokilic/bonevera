import 'package:flutter/foundation.dart';

import 'hour.dart';
import 'metadata.dart';

class ForecastHourly {
  final String name;
  final Metadata metadata;
  final List<Hour> hours;

  ForecastHourly({
    required this.name,
    required this.metadata,
    required this.hours,
  });

  factory ForecastHourly.fromMap(Map<String, dynamic> map) => ForecastHourly(
    name: map['name'] as String,
    metadata: Metadata.fromMap(map['metadata'] as Map<String, dynamic>),
    hours: List<Hour>.from(
      (map['hours'] as List).map<Hour>(
        (x) => Hour.fromMap(x as Map<String, dynamic>),
      ),
    ),
  );

  @override
  String toString() => 'ForecastHourly(name: $name, metadata: $metadata, hours: $hours)';

  @override
  bool operator ==(covariant ForecastHourly other) {
    if (identical(this, other)) {
      return true;
    }

    return other.name == name && other.metadata == metadata && listEquals(other.hours, hours);
  }

  @override
  int get hashCode => name.hashCode ^ metadata.hashCode ^ hours.hashCode;
}
