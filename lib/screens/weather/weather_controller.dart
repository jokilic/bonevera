import 'package:flutter/foundation.dart';
import 'package:latlong2/latlong.dart';

import '../../constants/enums.dart';
import '../../models/location/location.dart';
import '../../models/response_weather.dart';
import '../../services/api_service.dart';
import '../../services/logger_service.dart';
import '../../services/timezone_service.dart';
import '../../services/token_service.dart';
import '../../util/state.dart';

class WeatherController extends ValueNotifier<CJVnkState<ResponseWeather>> {
  ///
  /// CONSTRUCTOR
  ///

  final LoggerService logger;
  final APIService api;
  final TimezoneService timezone;
  final TokenService token;
  final Location location;

  WeatherController({
    required this.logger,
    required this.api,
    required this.timezone,
    required this.token,
    required this.location,
  }) : super(Initial());

  ///
  /// METHODS
  ///

  /// Fetches [ResponseWeather] and handles `state` accordingly
  Future<void> getWeather() async {
    value = Loading();

    /// Get `token`
    final tokenValue = await token.getToken();

    /// `token` exists, continue with fetching
    if (tokenValue != null) {
      final response = await api.getWeather(
        language: 'hr',
        countryCode: 'hr',
        coordinates: LatLng(
          location.latitude,
          location.longitude,
        ),
        timezone: timezone.timezone,
        tokenValue: tokenValue.value,
        dataSets: [
          DataSet.currentWeather,
          DataSet.forecastHourly,
          DataSet.forecastDaily,
        ],
      );

      /// Successful request
      if (response.weather != null && response.error == null) {
        final data = response.weather!;

        value = Success(
          data: data,
        );
      }

      /// Failed request
      if (response.weather == null && response.error != null) {
        /// Error is not null, update to error state
        value = Error(
          error: response.error,
        );
      }
    }
    /// `token` doesn't exist, throw error
    else {
      value = Error(
        error: "Token doesn't exist",
      );
    }
  }
}
