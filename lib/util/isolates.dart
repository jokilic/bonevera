import 'package:flutter/foundation.dart';

import '../models/response_weather.dart';

/// `weather` endpoint
Future<ResponseWeather> computeWeather(data) async => compute(parseWeather, data);
ResponseWeather parseWeather(data) => ResponseWeather.fromMap(data);
