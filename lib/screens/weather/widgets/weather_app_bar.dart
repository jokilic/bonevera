import 'package:flutter/material.dart';

import '../../../theme/theme.dart';
import 'weather_drawer_button.dart';

class WeatherAppBar extends StatelessWidget {
  final Function() onDrawerPressed;
  final String locationName;

  const WeatherAppBar({
    required this.onDrawerPressed,
    required this.locationName,
  });

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      ///
      /// LOCATIONS BUTTON
      ///
      WeatherDrawerButton(
        onPressed: onDrawerPressed,
      ),
      const SizedBox(width: 16),

      ///
      /// CURRENT LOCATION NAME
      ///
      Expanded(
        child: Text(
          locationName,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: context.textStyles.currentLocation,
        ),
      ),

      ///
      /// EMPTY SPACE
      ///
      const SizedBox(width: 16),
      WeatherDrawerButton(
        onPressed: () {},
        isHidden: true,
      ),
    ],
  );
}
