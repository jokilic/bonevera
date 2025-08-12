import 'dart:math';

import 'package:flutter/material.dart';

import '../../../theme/icons.dart';
import '../../../theme/theme.dart';
import '../../../util/parse/visibility.dart';
import '../../../util/parse/wind.dart';

class WeatherAdditionalWind extends StatelessWidget {
  final double? visibility;
  final int? windDirection;
  final double? windSpeed;

  const WeatherAdditionalWind({
    this.visibility,
    this.windDirection,
    this.windSpeed,
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
                'Visibility & Wind'.toUpperCase(),
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
              /// VISIBILITY
              ///
              if (visibility != null)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: getVisibilityString(visibility),
                          children: [
                            TextSpan(
                              text: 'km',
                              style: context.textStyles.weatherAdditionalSmallValue,
                            ),
                          ],
                        ),
                        style: context.textStyles.weatherAdditionalValue,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Visibility'.toUpperCase(),
                        style: context.textStyles.weatherAdditionalTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),

              ///
              /// WIND DIRECTION
              ///
              if (windDirection != null)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: getWindDirectionString(windDirection),
                          children: [
                            WidgetSpan(
                              child: Transform.rotate(
                                angle: (windDirection! - 90) * (pi / 180),
                                child: Image.asset(
                                  BoneveraIcons.arrow,
                                  width: 16,
                                  height: 16,
                                  color: context.colors.bottomWidgetText.withValues(alpha: 0.6),
                                ),
                              ),
                            ),
                          ],
                        ),
                        style: context.textStyles.weatherAdditionalValue,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Wind direction'.toUpperCase(),
                        style: context.textStyles.weatherAdditionalTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),

              ///
              /// WIND SPEED & GUST
              ///
              if (windSpeed != null)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: getWindSpeedString(windSpeed),
                          children: [
                            TextSpan(
                              text: 'km/h',
                              style: context.textStyles.weatherAdditionalSmallValue,
                            ),
                          ],
                        ),
                        style: context.textStyles.weatherAdditionalValue,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Wind speed'.toUpperCase(),
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
