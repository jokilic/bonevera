import '../constants/enums.dart';

class Forecast {
  final DateTime forecastStart;
  final DateTime forecastEnd;
  final double cloudCover;
  final String conditionCode;
  final double humidity;
  final double precipitationAmount;
  final double precipitationChance;
  final PrecipitationType precipitationType;
  final double snowfallAmount;
  final double temperatureMax;
  final double temperatureMin;
  final int windDirection;
  final double windGustSpeedMax;
  final double windSpeed;
  final double windSpeedMax;

  Forecast({
    required this.forecastStart,
    required this.forecastEnd,
    required this.cloudCover,
    required this.conditionCode,
    required this.humidity,
    required this.precipitationAmount,
    required this.precipitationChance,
    required this.precipitationType,
    required this.snowfallAmount,
    required this.temperatureMax,
    required this.temperatureMin,
    required this.windDirection,
    required this.windGustSpeedMax,
    required this.windSpeed,
    required this.windSpeedMax,
  });

  factory Forecast.fromMap(Map<String, dynamic> map) => Forecast(
    forecastStart: DateTime.parse(map['forecastStart'] as String),
    forecastEnd: DateTime.parse(map['forecastEnd'] as String),
    cloudCover: map['cloudCover'] as double,
    conditionCode: map['conditionCode'] as String,
    humidity: map['humidity'] as double,
    precipitationAmount: map['precipitationAmount'] as double,
    precipitationChance: map['precipitationChance'] as double,
    precipitationType: PrecipitationType.values.byName(map['precipitationType'] as String),
    snowfallAmount: map['snowfallAmount'] as double,
    temperatureMax: map['temperatureMax'] as double,
    temperatureMin: map['temperatureMin'] as double,
    windDirection: map['windDirection'] as int,
    windGustSpeedMax: map['windGustSpeedMax'] as double,
    windSpeed: map['windSpeed'] as double,
    windSpeedMax: map['windSpeedMax'] as double,
  );

  @override
  String toString() =>
      'Forecast(forecastStart: $forecastStart, forecastEnd: $forecastEnd, cloudCover: $cloudCover, conditionCode: $conditionCode, humidity: $humidity, precipitationAmount: $precipitationAmount, precipitationChance: $precipitationChance, precipitationType: $precipitationType, snowfallAmount: $snowfallAmount, temperatureMax: $temperatureMax, temperatureMin: $temperatureMin, windDirection: $windDirection, windGustSpeedMax: $windGustSpeedMax, windSpeed: $windSpeed, windSpeedMax: $windSpeedMax)';

  @override
  bool operator ==(covariant Forecast other) {
    if (identical(this, other)) {
      return true;
    }

    return other.forecastStart == forecastStart &&
        other.forecastEnd == forecastEnd &&
        other.cloudCover == cloudCover &&
        other.conditionCode == conditionCode &&
        other.humidity == humidity &&
        other.precipitationAmount == precipitationAmount &&
        other.precipitationChance == precipitationChance &&
        other.precipitationType == precipitationType &&
        other.snowfallAmount == snowfallAmount &&
        other.temperatureMax == temperatureMax &&
        other.temperatureMin == temperatureMin &&
        other.windDirection == windDirection &&
        other.windGustSpeedMax == windGustSpeedMax &&
        other.windSpeed == windSpeed &&
        other.windSpeedMax == windSpeedMax;
  }

  @override
  int get hashCode =>
      forecastStart.hashCode ^
      forecastEnd.hashCode ^
      cloudCover.hashCode ^
      conditionCode.hashCode ^
      humidity.hashCode ^
      precipitationAmount.hashCode ^
      precipitationChance.hashCode ^
      precipitationType.hashCode ^
      snowfallAmount.hashCode ^
      temperatureMax.hashCode ^
      temperatureMin.hashCode ^
      windDirection.hashCode ^
      windGustSpeedMax.hashCode ^
      windSpeed.hashCode ^
      windSpeedMax.hashCode;
}
