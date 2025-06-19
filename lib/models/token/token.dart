import 'package:hive_ce/hive.dart';

part 'token.g.dart';

@HiveType(typeId: 0)
class Token extends HiveObject {
  @HiveField(1)
  final String value;

  @HiveField(2)
  final DateTime expiry;

  Token({
    required this.value,
    required this.expiry,
  });

  @override
  String toString() => 'Token(value: $value, expiry: $expiry)';
}
