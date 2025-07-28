import 'package:hive_ce/hive.dart';

part 'location.g.dart';

@HiveType(typeId: 1)
class Location extends HiveObject {
  @HiveField(1)
  final String? name;

  @HiveField(2)
  final String? street;

  @HiveField(3)
  final String? isoCountryCode;

  @HiveField(4)
  final String? country;

  @HiveField(5)
  final String? postalCode;

  @HiveField(6)
  final String? administrativeArea;

  @HiveField(7)
  final String? subAdministrativeArea;

  @HiveField(8)
  final String? locality;

  @HiveField(9)
  final String? subLocality;

  @HiveField(10)
  final String? thoroughfare;

  @HiveField(11)
  final String? subThoroughfare;

  @HiveField(12)
  final double latitude;

  @HiveField(13)
  final double longitude;

  Location({
    required this.name,
    required this.street,
    required this.isoCountryCode,
    required this.country,
    required this.postalCode,
    required this.administrativeArea,
    required this.subAdministrativeArea,
    required this.locality,
    required this.subLocality,
    required this.thoroughfare,
    required this.subThoroughfare,
    required this.latitude,
    required this.longitude,
  });

  @override
  String toString() =>
      'Location(name: $name, street: $street, isoCountryCode: $isoCountryCode, country: $country, postalCode: $postalCode, administrativeArea: $administrativeArea, subAdministrativeArea: $subAdministrativeArea, locality: $locality, subLocality: $subLocality, thoroughfare: $thoroughfare, subThoroughfare: $subThoroughfare, latitude: $latitude, longitude: $longitude)';
}
