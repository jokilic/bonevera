import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

class WeatherCurrentTemperatureCondition extends StatelessWidget {
  final String currentTemperature;
  final String conditionText;
  final String currentHighTemperature;
  final String currentLowTemperature;

  const WeatherCurrentTemperatureCondition({
    required this.currentTemperature,
    required this.conditionText,
    required this.currentHighTemperature,
    required this.currentLowTemperature,
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
              ),

              const SizedBox(height: 2),

              ///
              /// HIGH / LOW TEMPERATURES
              ///
              Text.rich(
                TextSpan(
                  text: 'H: ',
                  children: [
                    TextSpan(
                      text: currentHighTemperature,
                      style: context.textStyles.currentHighLowTemperature.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const TextSpan(
                      text: ' | L: ',
                    ),
                    TextSpan(
                      text: currentLowTemperature,
                      style: context.textStyles.currentHighLowTemperature.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                style: context.textStyles.currentHighLowTemperature,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
