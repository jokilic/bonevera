import '../constants/enums.dart';

class CurrentWeather {
  final double? cloudCover;
  final ConditionCode conditionCode;
  final bool? daylight;
  final double humidity;
  final double precipitationIntensity;
  final double pressure;
  final double temperature;
  final double temperatureApparent;
  final int uvIndex;
  final double visibility;
  final int? windDirection;
  final double windSpeed;

  CurrentWeather({
    required this.cloudCover,
    required this.conditionCode,
    required this.daylight,
    required this.humidity,
    required this.precipitationIntensity,
    required this.pressure,
    required this.temperature,
    required this.temperatureApparent,
    required this.uvIndex,
    required this.visibility,
    required this.windDirection,
    required this.windSpeed,
  });

  factory CurrentWeather.fromMap(Map<String, dynamic> map) => CurrentWeather(
    cloudCover: map['cloudCover'] != null ? map['cloudCover'] as double : null,
    conditionCode: ConditionCode.values.byName(map['conditionCode'] as String),
    daylight: map['daylight'] != null ? map['daylight'] as bool : null,
    humidity: map['humidity'] as double,
    precipitationIntensity: map['precipitationIntensity'] as double,
    pressure: map['pressure'] as double,
    temperature: map['temperature'] as double,
    temperatureApparent: map['temperatureApparent'] as double,
    uvIndex: map['uvIndex'] as int,
    visibility: map['visibility'] as double,
    windDirection: map['windDirection'] != null ? map['windDirection'] as int : null,
    windSpeed: map['windSpeed'] as double,
  );

  @override
  String toString() =>
      'CurrentWeather(cloudCover: $cloudCover, conditionCode: $conditionCode, daylight: $daylight, humidity: $humidity, precipitationIntensity: $precipitationIntensity, pressure: $pressure, temperature: $temperature, temperatureApparent: $temperatureApparent, uvIndex: $uvIndex, visibility: $visibility, windDirection: $windDirection, windSpeed: $windSpeed)';

  @override
  bool operator ==(covariant CurrentWeather other) {
    if (identical(this, other)) {
      return true;
    }

    return other.cloudCover == cloudCover &&
        other.conditionCode == conditionCode &&
        other.daylight == daylight &&
        other.humidity == humidity &&
        other.precipitationIntensity == precipitationIntensity &&
        other.pressure == pressure &&
        other.temperature == temperature &&
        other.temperatureApparent == temperatureApparent &&
        other.uvIndex == uvIndex &&
        other.visibility == visibility &&
        other.windDirection == windDirection &&
        other.windSpeed == windSpeed;
  }

  @override
  int get hashCode =>
      cloudCover.hashCode ^
      conditionCode.hashCode ^
      daylight.hashCode ^
      humidity.hashCode ^
      precipitationIntensity.hashCode ^
      pressure.hashCode ^
      temperature.hashCode ^
      temperatureApparent.hashCode ^
      uvIndex.hashCode ^
      visibility.hashCode ^
      windDirection.hashCode ^
      windSpeed.hashCode;
}
