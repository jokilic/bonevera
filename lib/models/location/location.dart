import 'package:hive_ce/hive.dart';

part 'location.g.dart';

@HiveType(typeId: 1)
class Location extends HiveObject {
  @HiveField(1)
  final String name;

  @HiveField(2)
  final double latitude;

  @HiveField(3)
  final double longitude;

  Location({
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  @override
  String toString() => 'Location(name: $name, latitude: $latitude, longitude: $longitude)';
}
