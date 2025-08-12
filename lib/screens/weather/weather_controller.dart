import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:latlong2/latlong.dart';

import '../../constants/enums.dart';
import '../../models/day.dart';
import '../../models/hour.dart';
import '../../models/location/location.dart';
import '../../models/response_weather.dart';
import '../../services/api_service.dart';
import '../../services/logger_service.dart';
import '../../services/timezone_service.dart';
import '../../services/token_service.dart';
import '../../util/parse/date_time.dart';
import '../../util/state.dart';

class WeatherController extends ValueNotifier<BoneveraState<ResponseWeather>> implements Disposable {
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
  /// VARIABLES
  ///

  Day? today;
  List<Hour>? todayHours;
  List<Day>? daysExceptToday;

  final currentWeatherWidget = ValueNotifier<WeatherWidget>(
    WeatherWidget.chart,
  );

  ///
  /// DISPOSE
  ///

  @override
  void onDispose() {
    currentWeatherWidget.dispose();
  }

  ///
  /// METHODS
  ///

  /// Triggered when the user presses bottom weather [Widget]
  void toggleWeatherWidget() {
    final currentIndex = WeatherWidget.values.indexOf(currentWeatherWidget.value);
    final nextIndex = (currentIndex + 1) % WeatherWidget.values.length;
    currentWeatherWidget.value = WeatherWidget.values[nextIndex];
  }

  /// Calculates variables relevant for showing proper info on screen
  void calculateVariables({required ResponseWeather weather}) {
    today = getCurrentDay(
      weather.forecastDaily?.days,
    );

    todayHours = get24HoursFromDateTime(
      allHours: weather.forecastHourly?.hours,
      startTime: DateTime.now().toLocal(),
    );

    daysExceptToday = getDaysExceptToday(
      weather.forecastDaily?.days,
    );
  }

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

        calculateVariables(
          weather: data,
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
