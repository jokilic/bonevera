import '../constants/enums.dart';
import 'forecast.dart';

class Day {
  final DateTime forecastStart;
  final DateTime forecastEnd;
  final ConditionCode conditionCode;
  final int maxUvIndex;
  final MoonPhase moonPhase;
  final DateTime moonrise;
  final DateTime moonset;
  final double precipitationAmount;
  final double precipitationChance;
  final PrecipitationType precipitationType;
  final double snowfallAmount;
  final DateTime solarMidnight;
  final DateTime solarNoon;
  final DateTime sunrise;
  final DateTime sunriseCivil;
  final DateTime sunriseNautical;
  final DateTime sunriseAstronomical;
  final DateTime sunset;
  final DateTime sunsetCivil;
  final DateTime sunsetNautical;
  final DateTime sunsetAstronomical;
  final double temperatureMax;
  final double temperatureMin;
  final double windGustSpeedMax;
  final double windSpeedAvg;
  final double windSpeedMax;
  final Forecast daytimeForecast;
  final Forecast overnightForecast;
  final Forecast? restOfDayForecast;

  Day({
    required this.forecastStart,
    required this.forecastEnd,
    required this.conditionCode,
    required this.maxUvIndex,
    required this.moonPhase,
    required this.moonrise,
    required this.moonset,
    required this.precipitationAmount,
    required this.precipitationChance,
    required this.precipitationType,
    required this.snowfallAmount,
    required this.solarMidnight,
    required this.solarNoon,
    required this.sunrise,
    required this.sunriseCivil,
    required this.sunriseNautical,
    required this.sunriseAstronomical,
    required this.sunset,
    required this.sunsetCivil,
    required this.sunsetNautical,
    required this.sunsetAstronomical,
    required this.temperatureMax,
    required this.temperatureMin,
    required this.windGustSpeedMax,
    required this.windSpeedAvg,
    required this.windSpeedMax,
    required this.daytimeForecast,
    required this.overnightForecast,
    this.restOfDayForecast,
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
    moonrise: DateTime.parse(map['moonrise'] as String),
    moonset: DateTime.parse(map['moonset'] as String),
    precipitationAmount: map['precipitationAmount'] as double,
    precipitationChance: map['precipitationChance'] as double,
    precipitationType: PrecipitationType.values.byName(map['precipitationType'] as String),
    snowfallAmount: map['snowfallAmount'] as double,
    solarMidnight: DateTime.parse(map['solarMidnight'] as String),
    solarNoon: DateTime.parse(map['solarNoon'] as String),
    sunrise: DateTime.parse(map['sunrise'] as String),
    sunriseCivil: DateTime.parse(map['sunriseCivil'] as String),
    sunriseNautical: DateTime.parse(map['sunriseNautical'] as String),
    sunriseAstronomical: DateTime.parse(map['sunriseAstronomical'] as String),
    sunset: DateTime.parse(map['sunset'] as String),
    sunsetCivil: DateTime.parse(map['sunsetCivil'] as String),
    sunsetNautical: DateTime.parse(map['sunsetNautical'] as String),
    sunsetAstronomical: DateTime.parse(map['sunsetAstronomical'] as String),
    temperatureMax: map['temperatureMax'] as double,
    temperatureMin: map['temperatureMin'] as double,
    windGustSpeedMax: map['windGustSpeedMax'] as double,
    windSpeedAvg: map['windSpeedAvg'] as double,
    windSpeedMax: map['windSpeedMax'] as double,
    daytimeForecast: Forecast.fromMap(map['daytimeForecast'] as Map<String, dynamic>),
    overnightForecast: Forecast.fromMap(map['overnightForecast'] as Map<String, dynamic>),
    restOfDayForecast: map['restOfDayForecast'] != null ? Forecast.fromMap(map['restOfDayForecast'] as Map<String, dynamic>) : null,
  );

  @override
  String toString() =>
      'Day(forecastStart: $forecastStart, forecastEnd: $forecastEnd, conditionCode: $conditionCode, maxUvIndex: $maxUvIndex, moonPhase: $moonPhase, moonrise: $moonrise, moonset: $moonset, precipitationAmount: $precipitationAmount, precipitationChance: $precipitationChance, precipitationType: $precipitationType, snowfallAmount: $snowfallAmount, solarMidnight: $solarMidnight, solarNoon: $solarNoon, sunrise: $sunrise, sunriseCivil: $sunriseCivil, sunriseNautical: $sunriseNautical, sunriseAstronomical: $sunriseAstronomical, sunset: $sunset, sunsetCivil: $sunsetCivil, sunsetNautical: $sunsetNautical, sunsetAstronomical: $sunsetAstronomical, temperatureMax: $temperatureMax, temperatureMin: $temperatureMin, windGustSpeedMax: $windGustSpeedMax, windSpeedAvg: $windSpeedAvg, windSpeedMax: $windSpeedMax, daytimeForecast: $daytimeForecast, overnightForecast: $overnightForecast, restOfDayForecast: $restOfDayForecast)';

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
        other.moonrise == moonrise &&
        other.moonset == moonset &&
        other.precipitationAmount == precipitationAmount &&
        other.precipitationChance == precipitationChance &&
        other.precipitationType == precipitationType &&
        other.snowfallAmount == snowfallAmount &&
        other.solarMidnight == solarMidnight &&
        other.solarNoon == solarNoon &&
        other.sunrise == sunrise &&
        other.sunriseCivil == sunriseCivil &&
        other.sunriseNautical == sunriseNautical &&
        other.sunriseAstronomical == sunriseAstronomical &&
        other.sunset == sunset &&
        other.sunsetCivil == sunsetCivil &&
        other.sunsetNautical == sunsetNautical &&
        other.sunsetAstronomical == sunsetAstronomical &&
        other.temperatureMax == temperatureMax &&
        other.temperatureMin == temperatureMin &&
        other.windGustSpeedMax == windGustSpeedMax &&
        other.windSpeedAvg == windSpeedAvg &&
        other.windSpeedMax == windSpeedMax &&
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
      moonrise.hashCode ^
      moonset.hashCode ^
      precipitationAmount.hashCode ^
      precipitationChance.hashCode ^
      precipitationType.hashCode ^
      snowfallAmount.hashCode ^
      solarMidnight.hashCode ^
      solarNoon.hashCode ^
      sunrise.hashCode ^
      sunriseCivil.hashCode ^
      sunriseNautical.hashCode ^
      sunriseAstronomical.hashCode ^
      sunset.hashCode ^
      sunsetCivil.hashCode ^
      sunsetNautical.hashCode ^
      sunsetAstronomical.hashCode ^
      temperatureMax.hashCode ^
      temperatureMin.hashCode ^
      windGustSpeedMax.hashCode ^
      windSpeedAvg.hashCode ^
      windSpeedMax.hashCode ^
      daytimeForecast.hashCode ^
      overnightForecast.hashCode ^
      restOfDayForecast.hashCode;
}
