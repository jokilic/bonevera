import 'package:flutter/material.dart';

import '../../../theme/theme.dart';
import 'weather_drawer_button.dart';

class WeatherAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      ///
      /// LOCATIONS BUTTON
      ///
      const WeatherDrawerButton(),
      const SizedBox(width: 16),

      ///
      /// CURRENT LOCATION NAME
      ///
      Expanded(
        child: Text(
          'Zagreb',
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
      const WeatherDrawerButton(
        isHidden: true,
      ),
    ],
  );
}
