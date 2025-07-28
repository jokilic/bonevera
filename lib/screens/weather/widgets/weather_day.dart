import 'package:flutter/material.dart';

import '../../../theme/theme.dart';
import '../../../widgets/cjvnk_button.dart';

class WeatherDay extends StatelessWidget {
  final String title;
  final String conditionImage;
  final String lowTemperature;
  final String highTemperature;
  final String conditionText;

  const WeatherDay({
    required this.title,
    required this.conditionImage,
    required this.lowTemperature,
    required this.highTemperature,
    required this.conditionText,
  });

  @override
  Widget build(BuildContext context) => CJVnkButton(
    onPressed: () {},
    child: TextButton(
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
        backgroundColor: context.colors.background.withValues(alpha: 0.3),
        overlayColor: Colors.transparent,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ///
          /// TITLE
          ///
          Text(
            title.toUpperCase(),
            style: context.textStyles.currentDayTitle,
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
            '$highTemperature / $lowTemperature',
            style: context.textStyles.currentDayHighLowTemperature,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          ///
          /// CONDITION
          ///
          Text(
            conditionText.toUpperCase(),
            style: context.textStyles.currentDayCondition,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}
