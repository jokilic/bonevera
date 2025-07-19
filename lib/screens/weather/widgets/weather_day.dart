import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

class WeatherDay extends StatelessWidget {
  final String conditionImage;
  final String lowTemperature;
  final String highTemperature;

  const WeatherDay({
    required this.conditionImage,
    required this.lowTemperature,
    required this.highTemperature,
  });

  @override
  Widget build(BuildContext context) => TextButton(
    onPressed: () {},
    style: TextButton.styleFrom(
      fixedSize: const Size(104, 152),
      elevation: 0,
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 12,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: context.colors.white.withValues(alpha: 0.3),
      overlayColor: context.colors.white,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ///
        /// TITLE
        ///
        Text(
          'Today'.toUpperCase(),
          style: context.textStyles.todayTitle,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),

        ///
        /// WEATHER ICON
        ///
        Expanded(
          child: Image.asset(
            conditionImage,
          ),
        ),
        const SizedBox(height: 8),

        ///
        /// LOW / HIGH TEMPERATURES
        ///
        Text(
          '$lowTemperature / $highTemperature',
          style: context.textStyles.todayHighLowTemperature,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),

        ///
        /// CONDITION
        ///
        Text(
          'Mostly cloudy'.toUpperCase(),
          style: context.textStyles.todayCondition,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}
