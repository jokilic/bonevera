import '../constants/enums.dart';
import 'forecast.dart';

class Day {
  final DateTime forecastStart;
  final DateTime forecastEnd;
  final ConditionCode conditionCode;
  final int maxUvIndex;
  final MoonPhase moonPhase;
  final double precipitationAmount;
  final double precipitationChance;
  final PrecipitationType precipitationType;
  final double snowfallAmount;
  final DateTime? sunrise;
  final DateTime? sunset;
  final double temperatureMax;
  final double temperatureMin;
  final Forecast? daytimeForecast;
  final Forecast? overnightForecast;
  final Forecast? restOfDayForecast;

  Day({
    required this.forecastStart,
    required this.forecastEnd,
    required this.conditionCode,
    required this.maxUvIndex,
    required this.moonPhase,
    required this.precipitationAmount,
    required this.precipitationChance,
    required this.precipitationType,
    required this.snowfallAmount,
    required this.sunrise,
    required this.sunset,
    required this.temperatureMax,
    required this.temperatureMin,
    required this.daytimeForecast,
    required this.overnightForecast,
    required this.restOfDayForecast,
  });

  static MoonPhase getMoonPhase(String moonPhaseString) {
    if (moonPhaseString == 'new') {
      return MoonPhase.newMoon;
    }

    return MoonPhase.values.byName(moonPhaseString);
  }

  factory Day.fromMap(Map<String, dynamic> map) => Day(
    forecastStart: DateTime.parse(map['forecastStart'] as String),
    forecastEnd: DateTime.parse(map['forecastEnd'] as String),
    conditionCode: ConditionCode.values.byName(map['conditionCode'] as String),
    maxUvIndex: map['maxUvIndex'] as int,
    moonPhase: getMoonPhase(map['moonPhase'] as String),
    precipitationAmount: map['precipitationAmount'] as double,
    precipitationChance: map['precipitationChance'] as double,
    precipitationType: PrecipitationType.values.byName(map['precipitationType'] as String),
    snowfallAmount: map['snowfallAmount'] as double,
    sunrise: map['sunrise'] != null ? DateTime.parse(map['sunrise'] as String) : null,
    sunset: map['sunset'] != null ? DateTime.parse(map['sunset'] as String) : null,
    temperatureMax: map['temperatureMax'] as double,
    temperatureMin: map['temperatureMin'] as double,
    daytimeForecast: map['daytimeForecast'] != null ? Forecast.fromMap(map['daytimeForecast'] as Map<String, dynamic>) : null,
    overnightForecast: map['overnightForecast'] != null ? Forecast.fromMap(map['overnightForecast'] as Map<String, dynamic>) : null,
    restOfDayForecast: map['restOfDayForecast'] != null ? Forecast.fromMap(map['restOfDayForecast'] as Map<String, dynamic>) : null,
  );

  @override
  String toString() =>
      'Day(forecastStart: $forecastStart, forecastEnd: $forecastEnd, conditionCode: $conditionCode, maxUvIndex: $maxUvIndex, moonPhase: $moonPhase, precipitationAmount: $precipitationAmount, precipitationChance: $precipitationChance, precipitationType: $precipitationType, snowfallAmount: $snowfallAmount, sunrise: $sunrise, sunset: $sunset, temperatureMax: $temperatureMax, temperatureMin: $temperatureMin, daytimeForecast: $daytimeForecast, overnightForecast: $overnightForecast, restOfDayForecast: $restOfDayForecast)';

  @override
  bool operator ==(covariant Day other) {
    if (identical(this, other)) {
      return true;
    }

    return other.forecastStart == forecastStart &&
        other.forecastEnd == forecastEnd &&
        other.conditionCode == conditionCode &&
        other.maxUvIndex == maxUvIndex &&
        other.moonPhase == moonPhase &&
        other.precipitationAmount == precipitationAmount &&
        other.precipitationChance == precipitationChance &&
        other.precipitationType == precipitationType &&
        other.snowfallAmount == snowfallAmount &&
        other.sunrise == sunrise &&
        other.sunset == sunset &&
        other.temperatureMax == temperatureMax &&
        other.temperatureMin == temperatureMin &&
        other.daytimeForecast == daytimeForecast &&
        other.overnightForecast == overnightForecast &&
        other.restOfDayForecast == restOfDayForecast;
  }

  @override
  int get hashCode =>
      forecastStart.hashCode ^
      forecastEnd.hashCode ^
      conditionCode.hashCode ^
      maxUvIndex.hashCode ^
      moonPhase.hashCode ^
      precipitationAmount.hashCode ^
      precipitationChance.hashCode ^
      precipitationType.hashCode ^
      snowfallAmount.hashCode ^
      sunrise.hashCode ^
      sunset.hashCode ^
      temperatureMax.hashCode ^
      temperatureMin.hashCode ^
      daytimeForecast.hashCode ^
      overnightForecast.hashCode ^
      restOfDayForecast.hashCode;
}
