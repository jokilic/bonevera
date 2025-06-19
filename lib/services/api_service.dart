import 'dart:async';

import 'package:dio/dio.dart';
import 'package:latlong2/latlong.dart';

import '../constants/enums.dart';
import '../util/isolates.dart';
import 'logger_service.dart';

class APIService {
  ///
  /// CONSTRUCTOR
  ///

  final LoggerService logger;
  final Dio dio;

  APIService({
    required this.logger,
    required this.dio,
  });

  ///
  /// `/weather`
  ///

  Future<void> getWeather({
    required String language,
    required LatLng coordinates,
    required String countryCode,
    required String timezone,
    required String tokenValue,
    required List<DataSet> dataSets,
  }) async {
    try {
      final response = await dio.get(
        '/weather/$language/${coordinates.latitude}/${coordinates.longitude}',
        options: Options(
          headers: {
            'Authorization': 'Bearer $tokenValue',
          },
        ),
        queryParameters: {
          'countryCode': countryCode,
          'dataSets': dataSets.map((dataSet) => dataSet.name).join(','),
          'timezone': timezone,
        },
      );

      /// Handle status codes
      switch (response.statusCode) {
        /// `OK` - The request is successful. The weather alert is in the response
        case 200:
          final data = response.data;
          final parsedResponse = await computeWeather(data);

        /// `Bad Request` - The server is unable to process the request due to an invalid parameter value
        case 400:

        /// `Unauthorized` - The request isn’t authorized or doesn’t include the correct authentication information
        case 401:

        /// This shouldn't happen since it's not mentioned in the documentation
        default:
      }
    } catch (e) {
      logger.e('APIService -> getWeather() -> $e');
    }
  }

  ///
  /// `/availability`
  ///

  Future<void> getAvailability({
    required LatLng coordinates,
    required String country,
    required String jwt,
  }) async {
    try {
      final response = await dio.get(
        '/availability/${coordinates.latitude}/${coordinates.longitude}',
        options: Options(
          headers: {
            'Authorization': 'Bearer $jwt',
          },
        ),
        queryParameters: {
          'country': country,
        },
      );

      /// Handle status codes
      switch (response.statusCode) {
        /// `OK` - The request is successful. The data sets are in the response
        case 200:
          final data = response.data;
          final parsedResponse = (data as List<dynamic>)
              .map(
                (item) => DataSet.values.firstWhere((dataSet) => dataSet.name == item),
              )
              .toList();

        /// `Bad Request` - The server is unable to process the request due to an invalid parameter value
        case 400:

        /// `Unauthorized` - The request isn’t authorized or doesn’t include the correct authentication information
        case 401:

        /// This shouldn't happen since it's not mentioned in the documentation
        default:
      }
    } catch (e) {
      logger.e('APIService -> getAvailability() -> $e');
    }
  }
}
