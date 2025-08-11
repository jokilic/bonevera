import 'package:flutter/material.dart';

import '../../../theme/theme.dart';
import '../../../widgets/cjvnk_button.dart';

class DayWeatherHour extends StatelessWidget {
  final Function() onPressed;
  final String title;
  final String conditionImage;
  final String temperature;
  final String conditionText;

  const DayWeatherHour({
    required this.onPressed,
    required this.title,
    required this.conditionImage,
    required this.temperature,
    required this.conditionText,
  });

  @override
  Widget build(BuildContext context) => CJVnkButton(
    onPressed: onPressed,
    child: TextButton(
      onPressed: null,
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
        backgroundColor: context.colors.appBarDaysBackground,
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
            style: context.textStyles.dayTitle,
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
          /// TEMPERATURE
          ///
          Text(
            '$temperature°',
            style: context.textStyles.dayHighLowTemperature,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          ///
          /// CONDITION
          ///
          Text(
            conditionText.toUpperCase(),
            style: context.textStyles.dayCondition,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}
