import 'package:latlong2/latlong.dart';

import '../constants/enums.dart';

class Metadata {
  final String attributionUrl;
  final DateTime expireTime;
  final LatLng coordinates;
  final DateTime readTime;
  final DateTime reportedTime;
  final UnitsSystem units;
  final int version;
  final String sourceType;

  Metadata({
    required this.attributionUrl,
    required this.expireTime,
    required this.coordinates,
    required this.readTime,
    required this.reportedTime,
    required this.units,
    required this.version,
    required this.sourceType,
  });

  factory Metadata.fromMap(Map<String, dynamic> map) => Metadata(
    attributionUrl: map['attributionURL'] as String,
    expireTime: DateTime.parse(map['expireTime'] as String),
    coordinates: LatLng(
      map['latitude'] as double,
      map['longitude'] as double,
    ),
    readTime: DateTime.parse(map['readTime'] as String),
    reportedTime: DateTime.parse(map['reportedTime'] as String),
    units: UnitsSystem.values.byName(map['units'] as String),
    version: map['version'] as int,
    sourceType: map['sourceType'] as String,
  );

  @override
  String toString() =>
      'Metadata(attributionUrl: $attributionUrl, expireTime: $expireTime, coordinates: $coordinates, readTime: $readTime, reportedTime: $reportedTime, units: $units, version: $version, sourceType: $sourceType)';

  @override
  bool operator ==(covariant Metadata other) {
    if (identical(this, other)) {
      return true;
    }

    return other.attributionUrl == attributionUrl &&
        other.expireTime == expireTime &&
        other.coordinates == coordinates &&
        other.readTime == readTime &&
        other.reportedTime == reportedTime &&
        other.units == units &&
        other.version == version &&
        other.sourceType == sourceType;
  }

  @override
  int get hashCode =>
      attributionUrl.hashCode ^ expireTime.hashCode ^ coordinates.hashCode ^ readTime.hashCode ^ reportedTime.hashCode ^ units.hashCode ^ version.hashCode ^ sourceType.hashCode;
}
