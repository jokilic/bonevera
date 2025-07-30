import '../constants/enums.dart';

class CurrentWeather {
  final ConditionCode conditionCode;
  final bool? daylight;
  final double temperature;

  CurrentWeather({
    required this.conditionCode,
    required this.daylight,
    required this.temperature,
  });

  factory CurrentWeather.fromMap(Map<String, dynamic> map) => CurrentWeather(
    conditionCode: ConditionCode.values.byName(map['conditionCode'] as String),
    daylight: map['daylight'] != null ? map['daylight'] as bool : null,
    temperature: map['temperature'] as double,
  );

  @override
  String toString() => 'CurrentWeather(conditionCode: $conditionCode, daylight: $daylight, temperature: $temperature)';

  @override
  bool operator ==(covariant CurrentWeather other) {
    if (identical(this, other)) {
      return true;
    }

    return other.conditionCode == conditionCode && other.daylight == daylight && other.temperature == temperature;
  }

  @override
  int get hashCode => conditionCode.hashCode ^ daylight.hashCode ^ temperature.hashCode;
}
