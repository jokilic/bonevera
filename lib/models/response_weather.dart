import 'current_weather.dart';
import 'forecast_daily.dart';
import 'forecast_hourly.dart';

class ResponseWeather {
  final CurrentWeather? currentWeather;
  final ForecastDaily? forecastDaily;
  final ForecastHourly? forecastHourly;

  ResponseWeather({
    this.currentWeather,
    this.forecastDaily,
    this.forecastHourly,
  });

  factory ResponseWeather.fromMap(Map<String, dynamic> map) => ResponseWeather(
    currentWeather: map['currentWeather'] != null ? CurrentWeather.fromMap(map['currentWeather'] as Map<String, dynamic>) : null,
    forecastDaily: map['forecastDaily'] != null ? ForecastDaily.fromMap(map['forecastDaily'] as Map<String, dynamic>) : null,
    forecastHourly: map['forecastHourly'] != null ? ForecastHourly.fromMap(map['forecastHourly'] as Map<String, dynamic>) : null,
  );

  @override
  String toString() => 'ResponseWeather(currentWeather: $currentWeather, forecastDaily: $forecastDaily, forecastHourly: $forecastHourly)';

  @override
  bool operator ==(covariant ResponseWeather other) {
    if (identical(this, other)) {
      return true;
    }

    return other.currentWeather == currentWeather && other.forecastDaily == forecastDaily && other.forecastHourly == forecastHourly;
  }

  @override
  int get hashCode => currentWeather.hashCode ^ forecastDaily.hashCode ^ forecastHourly.hashCode;
}
