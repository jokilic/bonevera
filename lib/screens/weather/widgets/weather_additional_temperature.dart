import 'package:flutter/material.dart';

import '../../../theme/icons.dart';
import '../../../theme/theme.dart';
import '../../../util/parse/pressure.dart';
import '../../../util/parse/temperature.dart';

class WeatherAdditionalTemperature extends StatelessWidget {
  final double? temperatureApparent;
  final double? pressure;
  final int? uvIndex;

  const WeatherAdditionalTemperature({
    this.temperatureApparent,
    this.pressure,
    this.uvIndex,
  });

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.symmetric(horizontal: 16),
    padding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    decoration: BoxDecoration(
      color: context.colors.bottomWidgetBackground,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Temperature & Pressure'.toUpperCase(),
                style: context.textStyles.chartTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Image.asset(
              BoneveraIcons.arrow,
              height: 16,
              width: 16,
              color: context.colors.bottomWidgetText,
            ),
          ],
        ),
        const SizedBox(height: 4),
        Expanded(
          child: Row(
            children: [
              ///
              /// TEMPERATURE APPARENT
              ///
              if (temperatureApparent != null)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: getTemperatureString(temperatureApparent),
                          children: [
                            TextSpan(
                              text: '°',
                              style: context.textStyles.weatherAdditionalValue.copyWith(
                                color: context.colors.bottomWidgetText.withValues(alpha: 0.6),
                              ),
                            ),
                          ],
                        ),
                        style: context.textStyles.weatherAdditionalValue,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Feels like'.toUpperCase(),
                        style: context.textStyles.weatherAdditionalTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),

              ///
              /// PRESSURE
              ///
              if (pressure != null)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: getPressureString(pressure),
                          children: [
                            TextSpan(
                              text: 'hPa',
                              style: context.textStyles.weatherAdditionalSmallValue,
                            ),
                          ],
                        ),
                        style: context.textStyles.weatherAdditionalValue,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Pressure'.toUpperCase(),
                        style: context.textStyles.weatherAdditionalTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),

              ///
              /// UV INDEX
              ///
              if (uvIndex != null)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$uvIndex',
                        style: context.textStyles.weatherAdditionalValue,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'UV Index'.toUpperCase(),
                        style: context.textStyles.weatherAdditionalTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    ),
  );
}
