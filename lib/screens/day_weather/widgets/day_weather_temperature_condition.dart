import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

class DayWeatherTemperatureCondition extends StatelessWidget {
  final String conditionText;
  final String highTemperature;
  final String lowTemperature;

  const DayWeatherTemperatureCondition({
    required this.conditionText,
    required this.highTemperature,
    required this.lowTemperature,
  });

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 32),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ///
        /// TEMPERATURES
        ///
        SizedBox(
          width: 112,
          child: Column(
            children: [
              ///
              /// HIGH TEMPERATURE
              ///
              Align(
                alignment: Alignment.topLeft,
                child: Text.rich(
                  TextSpan(
                    text: highTemperature,
                    children: [
                      TextSpan(
                        text: '°',
                        style: context.textStyles.dayTemperatureHighLow,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                  style: context.textStyles.dayTemperatureHighLow,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              const SizedBox(height: 8),

              ///
              /// LOW TEMPERATURE
              ///
              Align(
                alignment: Alignment.bottomRight,
                child: Text.rich(
                  TextSpan(
                    text: lowTemperature,
                    children: [
                      TextSpan(
                        text: '°',
                        style: context.textStyles.dayTemperatureHighLow,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                  style: context.textStyles.dayTemperatureHighLow,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(width: 24),

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
              // TODO: Something else here
              Text.rich(
                TextSpan(
                  text: 'H: ',
                  children: [
                    TextSpan(
                      text: '$highTemperature°',
                      style: context.textStyles.currentHighLowTemperature.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const TextSpan(
                      text: ' | L: ',
                    ),
                    TextSpan(
                      text: '$lowTemperature°',
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
