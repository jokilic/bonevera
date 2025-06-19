import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'TEAM_ID', obfuscate: true)
  static final String teamId = _Env.teamId;

  @EnviedField(varName: 'KEY_ID', obfuscate: true)
  static final String keyId = _Env.keyId;

  @EnviedField(varName: 'SERVICE_ID', obfuscate: true)
  static final String serviceId = _Env.serviceId;

  @EnviedField(varName: 'PEM_ADDRESS', obfuscate: true)
  static final String pemAddress = _Env.pemAddress;
}
