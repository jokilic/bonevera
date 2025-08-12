import 'package:flutter/material.dart';

import '../../../theme/icons.dart';
import '../../../theme/theme.dart';
import '../../../util/parse/percentage.dart';

class WeatherAdditionalAir extends StatelessWidget {
  final double? cloudCover;
  final double? humidity;
  final double? precipitationIntensity;

  const WeatherAdditionalAir({
    this.cloudCover,
    this.humidity,
    this.precipitationIntensity,
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
                'Air & Moisture'.toUpperCase(),
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
              /// CLOUD COVER
              ///
              if (cloudCover != null)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: getPercentageString(cloudCover),
                          children: [
                            TextSpan(
                              text: '%',
                              style: context.textStyles.weatherAdditionalSmallValue,
                            ),
                          ],
                        ),
                        style: context.textStyles.weatherAdditionalValue,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Clouds'.toUpperCase(),
                        style: context.textStyles.weatherAdditionalTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),

              ///
              /// HUMIDITY
              ///
              if (humidity != null)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: getPercentageString(humidity),
                          children: [
                            TextSpan(
                              text: '%',
                              style: context.textStyles.weatherAdditionalSmallValue,
                            ),
                          ],
                        ),
                        style: context.textStyles.weatherAdditionalValue,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Humidity'.toUpperCase(),
                        style: context.textStyles.weatherAdditionalTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),

              ///
              /// PRECIPITATION INTENSITY
              ///
              if (precipitationIntensity != null)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: '${precipitationIntensity!.round()}',
                          children: [
                            TextSpan(
                              text: 'mm',
                              style: context.textStyles.weatherAdditionalSmallValue,
                            ),
                          ],
                        ),
                        style: context.textStyles.weatherAdditionalValue,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Precipitation'.toUpperCase(),
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
