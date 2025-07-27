import 'package:flutter/material.dart';

import '../../../theme/theme.dart';
import '../../../widgets/cjvnk_drawer_button.dart';

class WeatherAppBar extends StatelessWidget {
  final String locationName;

  const WeatherAppBar({
    required this.locationName,
  });

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 8,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ///
        /// LOCATIONS BUTTON
        ///
        CJVnkDrawerButton(
          onPressed: () {},
          isHidden: true,
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
        CJVnkDrawerButton(
          onPressed: () {},
          isHidden: true,
        ),
      ],
    ),
  );
}
