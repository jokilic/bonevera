import '../constants/enums.dart';

class Summary {
  final DateTime startTime;
  final PrecipitationType condition;
  final double precipitationChance;
  final double precipitationIntensity;

  Summary({
    required this.startTime,
    required this.condition,
    required this.precipitationChance,
    required this.precipitationIntensity,
  });

  factory Summary.fromMap(Map<String, dynamic> map) => Summary(
    startTime: DateTime.parse(map['startTime'] as String),
    condition: PrecipitationType.values.byName(map['condition'] as String),
    precipitationChance: map['precipitationChance'] as double,
    precipitationIntensity: map['precipitationIntensity'] as double,
  );

  @override
  String toString() => 'Summary(startTime: $startTime, condition: $condition, precipitationChance: $precipitationChance, precipitationIntensity: $precipitationIntensity)';

  @override
  bool operator ==(covariant Summary other) {
    if (identical(this, other)) {
      return true;
    }

    return other.startTime == startTime &&
        other.condition == condition &&
        other.precipitationChance == precipitationChance &&
        other.precipitationIntensity == precipitationIntensity;
  }

  @override
  int get hashCode => startTime.hashCode ^ condition.hashCode ^ precipitationChance.hashCode ^ precipitationIntensity.hashCode;
}
