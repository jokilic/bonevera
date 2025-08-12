import 'package:flutter/material.dart';

import '../theme/theme.dart';
import 'hive_service.dart';
import 'logger_service.dart';

class ThemeService extends ValueNotifier<ThemeData?> {
  final LoggerService logger;
  final HiveService hive;

  ThemeService({
    required this.logger,
    required this.hive,
  }) : super(BoneveraTheme.dark);

  ///
  /// METHODS
  ///

  Future<void> updateTheme(ThemeData newTheme) async => value = newTheme;
}
