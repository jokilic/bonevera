class Minute {
  final DateTime startTime;
  final double precipitationChance;
  final double precipitationIntensity;

  Minute({
    required this.startTime,
    required this.precipitationChance,
    required this.precipitationIntensity,
  });

  factory Minute.fromMap(Map<String, dynamic> map) => Minute(
    startTime: DateTime.parse(map['startTime'] as String),
    precipitationChance: map['precipitationChance'] as double,
    precipitationIntensity: map['precipitationIntensity'] as double,
  );

  @override
  String toString() => 'Minute(startTime: $startTime, precipitationChance: $precipitationChance, precipitationIntensity: $precipitationIntensity)';

  @override
  bool operator ==(covariant Minute other) {
    if (identical(this, other)) {
      return true;
    }

    return other.startTime == startTime && other.precipitationChance == precipitationChance && other.precipitationIntensity == precipitationIntensity;
  }

  @override
  int get hashCode => startTime.hashCode ^ precipitationChance.hashCode ^ precipitationIntensity.hashCode;
}
