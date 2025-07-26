import 'package:hive_ce/hive.dart';

part 'location.g.dart';

@HiveType(typeId: 1)
class Location extends HiveObject {
  @HiveField(1)
  final String locality;

  @HiveField(2)
  final String country;

  @HiveField(3)
  final double latitude;

  @HiveField(4)
  final double longitude;

  Location({
    required this.locality,
    required this.country,
    required this.latitude,
    required this.longitude,
  });

  @override
  String toString() => 'Location(locality: $locality, country: $country, latitude: $latitude, longitude: $longitude)';
}
