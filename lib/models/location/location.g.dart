// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocationAdapter extends TypeAdapter<Location> {
  @override
  final typeId = 1;

  @override
  Location read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Location(
      name: fields[1] as String?,
      street: fields[2] as String?,
      isoCountryCode: fields[3] as String?,
      country: fields[4] as String?,
      postalCode: fields[5] as String?,
      administrativeArea: fields[6] as String?,
      subAdministrativeArea: fields[7] as String?,
      locality: fields[8] as String?,
      subLocality: fields[9] as String?,
      thoroughfare: fields[10] as String?,
      subThoroughfare: fields[11] as String?,
      latitude: (fields[12] as num).toDouble(),
      longitude: (fields[13] as num).toDouble(),
    );
  }

  @override
  void write(BinaryWriter writer, Location obj) {
    writer
      ..writeByte(13)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.street)
      ..writeByte(3)
      ..write(obj.isoCountryCode)
      ..writeByte(4)
      ..write(obj.country)
      ..writeByte(5)
      ..write(obj.postalCode)
      ..writeByte(6)
      ..write(obj.administrativeArea)
      ..writeByte(7)
      ..write(obj.subAdministrativeArea)
      ..writeByte(8)
      ..write(obj.locality)
      ..writeByte(9)
      ..write(obj.subLocality)
      ..writeByte(10)
      ..write(obj.thoroughfare)
      ..writeByte(11)
      ..write(obj.subThoroughfare)
      ..writeByte(12)
      ..write(obj.latitude)
      ..writeByte(13)
      ..write(obj.longitude);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
