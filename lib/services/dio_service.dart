import 'package:dio/dio.dart';

import 'logger_service.dart';

class DioService {
  ///
  /// CONSTRUCTOR
  ///

  final LoggerService logger;

  DioService({
    required this.logger,
  });

  ///
  /// VARIABLES
  ///

  late final dio =
      Dio(
          BaseOptions(
            baseUrl: 'https://weatherkit.apple.com/api/v1',
            validateStatus: (_) => true,
          ),
        )
        ..interceptors.add(
          DioLoggerInterceptor(
            logger: logger,
          ),
        );
}
