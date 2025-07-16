import '../constants/enums.dart';

class Hour {
  final DateTime forecastStart;
  final double cloudCover;
  final ConditionCode conditionCode;
  final bool daylight;
  final double humidity;
  final double precipitationAmount;
  final double precipitationIntensity;
  final double precipitationChance;
  final PrecipitationType precipitationType;
  final double pressure;
  final PressureTrend pressureTrend;
  final double snowfallIntensity;
  final double snowfallAmount;
  final double temperature;
  final double temperatureApparent;
  final double temperatureDewPoint;
  final int uvIndex;
  final double visibility;
  final int windDirection;
  final double windGust;
  final double windSpeed;

  Hour({
    required this.forecastStart,
    required this.cloudCover,
    required this.conditionCode,
    required this.daylight,
    required this.humidity,
    required this.precipitationAmount,
    required this.precipitationIntensity,
    required this.precipitationChance,
    required this.precipitationType,
    required this.pressure,
    required this.pressureTrend,
    required this.snowfallIntensity,
    required this.snowfallAmount,
    required this.temperature,
    required this.temperatureApparent,
    required this.temperatureDewPoint,
    required this.uvIndex,
    required this.visibility,
    required this.windDirection,
    required this.windGust,
    required this.windSpeed,
  });

  factory Hour.fromMap(Map<String, dynamic> map) => Hour(
    forecastStart: DateTime.parse(map['forecastStart'] as String),
    cloudCover: map['cloudCover'] as double,
    conditionCode: ConditionCode.values.byName(map['conditionCode'] as String),
    daylight: map['daylight'] as bool,
    humidity: map['humidity'] as double,
    precipitationAmount: map['precipitationAmount'] as double,
    precipitationIntensity: map['precipitationIntensity'] as double,
    precipitationChance: map['precipitationChance'] as double,
    precipitationType: PrecipitationType.values.byName(map['precipitationType'] as String),
    pressure: map['pressure'] as double,
    pressureTrend: PressureTrend.values.byName(map['pressureTrend'] as String),
    snowfallIntensity: map['snowfallIntensity'] as double,
    snowfallAmount: map['snowfallAmount'] as double,
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
      'Hour(forecastStart: $forecastStart, cloudCover: $cloudCover, conditionCode: $conditionCode, daylight: $daylight, humidity: $humidity, precipitationAmount: $precipitationAmount, precipitationIntensity: $precipitationIntensity, precipitationChance: $precipitationChance, precipitationType: $precipitationType, pressure: $pressure, pressureTrend: $pressureTrend, snowfallIntensity: $snowfallIntensity, snowfallAmount: $snowfallAmount, temperature: $temperature, temperatureApparent: $temperatureApparent, temperatureDewPoint: $temperatureDewPoint, uvIndex: $uvIndex, visibility: $visibility, windDirection: $windDirection, windGust: $windGust, windSpeed: $windSpeed)';

  @override
  bool operator ==(covariant Hour other) {
    if (identical(this, other)) {
      return true;
    }

    return other.forecastStart == forecastStart &&
        other.cloudCover == cloudCover &&
        other.conditionCode == conditionCode &&
        other.daylight == daylight &&
        other.humidity == humidity &&
        other.precipitationAmount == precipitationAmount &&
        other.precipitationIntensity == precipitationIntensity &&
        other.precipitationChance == precipitationChance &&
        other.precipitationType == precipitationType &&
        other.pressure == pressure &&
        other.pressureTrend == pressureTrend &&
        other.snowfallIntensity == snowfallIntensity &&
        other.snowfallAmount == snowfallAmount &&
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
      forecastStart.hashCode ^
      cloudCover.hashCode ^
      conditionCode.hashCode ^
      daylight.hashCode ^
      humidity.hashCode ^
      precipitationAmount.hashCode ^
      precipitationIntensity.hashCode ^
      precipitationChance.hashCode ^
      precipitationType.hashCode ^
      pressure.hashCode ^
      pressureTrend.hashCode ^
      snowfallIntensity.hashCode ^
      snowfallAmount.hashCode ^
      temperature.hashCode ^
      temperatureApparent.hashCode ^
      temperatureDewPoint.hashCode ^
      uvIndex.hashCode ^
      visibility.hashCode ^
      windDirection.hashCode ^
      windGust.hashCode ^
      windSpeed.hashCode;
}
