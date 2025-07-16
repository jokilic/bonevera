import '../constants/enums.dart';
import 'metadata.dart';

class CurrentWeather {
  final String name;
  final Metadata metadata;
  final DateTime asOf;
  final double cloudCover;
  final double cloudCoverLowAltPct;
  final double cloudCoverMidAltPct;
  final double cloudCoverHighAltPct;
  final ConditionCode conditionCode;
  final bool daylight;
  final double humidity;
  final double precipitationIntensity;
  final double pressure;
  final PressureTrend pressureTrend;
  final double temperature;
  final double temperatureApparent;
  final double temperatureDewPoint;
  final int uvIndex;
  final double visibility;
  final int windDirection;
  final double windGust;
  final double windSpeed;

  CurrentWeather({
    required this.name,
    required this.metadata,
    required this.asOf,
    required this.cloudCover,
    required this.cloudCoverLowAltPct,
    required this.cloudCoverMidAltPct,
    required this.cloudCoverHighAltPct,
    required this.conditionCode,
    required this.daylight,
    required this.humidity,
    required this.precipitationIntensity,
    required this.pressure,
    required this.pressureTrend,
    required this.temperature,
    required this.temperatureApparent,
    required this.temperatureDewPoint,
    required this.uvIndex,
    required this.visibility,
    required this.windDirection,
    required this.windGust,
    required this.windSpeed,
  });

  factory CurrentWeather.fromMap(Map<String, dynamic> map) => CurrentWeather(
    name: map['name'] as String,
    metadata: Metadata.fromMap(map['metadata'] as Map<String, dynamic>),
    asOf: DateTime.parse(map['asOf'] as String),
    cloudCover: map['cloudCover'] as double,
    cloudCoverLowAltPct: map['cloudCoverLowAltPct'] as double,
    cloudCoverMidAltPct: map['cloudCoverMidAltPct'] as double,
    cloudCoverHighAltPct: map['cloudCoverHighAltPct'] as double,
    conditionCode: ConditionCode.values.byName(map['conditionCode'] as String),
    daylight: map['daylight'] as bool,
    humidity: map['humidity'] as double,
    precipitationIntensity: map['precipitationIntensity'] as double,
    pressure: map['pressure'] as double,
    pressureTrend: PressureTrend.values.byName(map['pressureTrend'] as String),
    temperature: map['temperature'] as double,
    temperatureApparent: map['temperatureApparent'] as double,
    temperatureDewPoint: map['temperatureDewPoint'] as double,
    uvIndex: map['uvIndex'] as int,
    visibility: map['visibility'] as double,
    windDirection: map['windDirection'] as int,
    windGust: map['windGust'] as double,
    windSpeed: map['windSpeed'] as double,
  );

  @override
  String toString() =>
      'CurrentWeather(name: $name, metadata: $metadata, asOf: $asOf, cloudCover: $cloudCover, cloudCoverLowAltPct: $cloudCoverLowAltPct, cloudCoverMidAltPct: $cloudCoverMidAltPct, cloudCoverHighAltPct: $cloudCoverHighAltPct, conditionCode: $conditionCode, daylight: $daylight, humidity: $humidity, precipitationIntensity: $precipitationIntensity, pressure: $pressure, pressureTrend: $pressureTrend, temperature: $temperature, temperatureApparent: $temperatureApparent, temperatureDewPoint: $temperatureDewPoint, uvIndex: $uvIndex, visibility: $visibility, windDirection: $windDirection, windGust: $windGust, windSpeed: $windSpeed)';

  @override
  bool operator ==(covariant CurrentWeather other) {
    if (identical(this, other)) {
      return true;
    }

    return other.name == name &&
        other.metadata == metadata &&
        other.asOf == asOf &&
        other.cloudCover == cloudCover &&
        other.cloudCoverLowAltPct == cloudCoverLowAltPct &&
        other.cloudCoverMidAltPct == cloudCoverMidAltPct &&
        other.cloudCoverHighAltPct == cloudCoverHighAltPct &&
        other.conditionCode == conditionCode &&
        other.daylight == daylight &&
        other.humidity == humidity &&
        other.precipitationIntensity == precipitationIntensity &&
        other.pressure == pressure &&
        other.pressureTrend == pressureTrend &&
        other.temperature == temperature &&
        other.temperatureApparent == temperatureApparent &&
        other.temperatureDewPoint == temperatureDewPoint &&
        other.uvIndex == uvIndex &&
        other.visibility == visibility &&
        other.windDirection == windDirection &&
        other.windGust == windGust &&
        other.windSpeed == windSpeed;
  }

  @override
  int get hashCode =>
      name.hashCode ^
      metadata.hashCode ^
      asOf.hashCode ^
      cloudCover.hashCode ^
      cloudCoverLowAltPct.hashCode ^
      cloudCoverMidAltPct.hashCode ^
      cloudCoverHighAltPct.hashCode ^
      conditionCode.hashCode ^
      daylight.hashCode ^
      humidity.hashCode ^
      precipitationIntensity.hashCode ^
      pressure.hashCode ^
      pressureTrend.hashCode ^
      temperature.hashCode ^
      temperatureApparent.hashCode ^
      temperatureDewPoint.hashCode ^
      uvIndex.hashCode ^
      visibility.hashCode ^
      windDirection.hashCode ^
      windGust.hashCode ^
      windSpeed.hashCode;
}
