import 'package:get_it/get_it.dart';

import '../services/api_service.dart';
import '../services/dio_service.dart';
import '../services/hive_service.dart';
import '../services/location_service.dart';
import '../services/logger_service.dart';
import '../services/permission_service.dart';
import '../services/theme_service.dart';
import '../services/timezone_service.dart';
import '../services/token_service.dart';

final getIt = GetIt.instance;

/// Registers a class if it's not already initialized
/// Optionally runs a function with newly registered class
void registerIfNotInitialized<T extends Object>(
  T Function() factoryFunc, {
  String? instanceName,
  void Function(T controller)? afterRegister,
}) {
  if (!getIt.isRegistered<T>(instanceName: instanceName)) {
    getIt.registerLazySingleton<T>(
      factoryFunc,
      instanceName: instanceName,
    );

    if (afterRegister != null) {
      final instance = getIt.get<T>(instanceName: instanceName);
      afterRegister(instance);
    }
  }
}

void initializeServices() {
  getIt
    ..registerSingletonAsync(
      () async => LoggerService(),
    )
    ..registerSingletonAsync(
      () async {
        final hive = HiveService(
          logger: getIt.get<LoggerService>(),
        );
        await hive.init();
        return hive;
      },
      dependsOn: [LoggerService],
    )
    ..registerSingletonAsync(
      () async => ThemeService(
        logger: getIt.get<LoggerService>(),
        hive: getIt.get<HiveService>(),
      ),
      dependsOn: [LoggerService, HiveService],
    )
    ..registerSingletonAsync(
      () async => DioService(
        logger: getIt.get<LoggerService>(),
      ),
      dependsOn: [LoggerService],
    )
    ..registerSingletonAsync(
      () async => TokenService(
        logger: getIt.get<LoggerService>(),
        hive: getIt.get<HiveService>(),
      ),
      dependsOn: [LoggerService, HiveService],
    )
    ..registerSingletonAsync(
      () async {
        final timezone = TimezoneService(
          logger: getIt.get<LoggerService>(),
        );
        await timezone.getDeviceTimezone();
        return timezone;
      },
      dependsOn: [LoggerService],
    )
    ..registerSingletonAsync(
      () async => PermissionService(
        logger: getIt.get<LoggerService>(),
      ),
      dependsOn: [LoggerService],
    )
    ..registerSingletonAsync(
      () async => LocationService(
        logger: getIt.get<LoggerService>(),
      ),
      dependsOn: [LoggerService],
    )
    ..registerSingletonAsync(
      () async => APIService(
        logger: getIt.get<LoggerService>(),
        dio: getIt.get<DioService>().dio,
      ),
      dependsOn: [LoggerService, DioService],
    );
}
