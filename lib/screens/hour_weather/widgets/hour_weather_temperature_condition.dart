import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

class HourWeatherTemperatureCondition extends StatelessWidget {
  final String currentTemperature;
  final String conditionText;
  final String feelsLikeTemperature;

  const HourWeatherTemperatureCondition({
    required this.currentTemperature,
    required this.conditionText,
    required this.feelsLikeTemperature,
  });

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 32),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ///
        /// TEMPERATURE
        ///
        Text.rich(
          TextSpan(
            text: currentTemperature,
            children: [
              TextSpan(
                text: '°',
                style: context.textStyles.currentTemperature,
              ),
            ],
          ),
          textAlign: TextAlign.center,
          style: context.textStyles.currentTemperature,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),

        const SizedBox(width: 8),

        ///
        /// CONDITION & HIGH / LOW TEMPERATURES
        ///
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///
              /// CONDITION
              ///
              Text(
                conditionText,
                style: context.textStyles.currentCondition,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 2),

              ///
              /// HIGH / LOW TEMPERATURES
              ///
              Text.rich(
                TextSpan(
                  text: 'Feels like: ',
                  children: [
                    TextSpan(
                      text: '$feelsLikeTemperature°',
                      style: context.textStyles.currentHighLowTemperature.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                style: context.textStyles.currentHighLowTemperature,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
