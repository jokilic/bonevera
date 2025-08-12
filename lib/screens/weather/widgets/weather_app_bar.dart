import 'package:flutter/material.dart';

import '../../../theme/theme.dart';
import '../../../widgets/bonevera_drawer_button.dart';

class WeatherAppBar extends StatelessWidget {
  final String title;
  final String? subtitle;

  const WeatherAppBar({
    required this.title,
    this.subtitle,
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
        BoneveraDrawerButton(
          onPressed: () {},
          isHidden: true,
        ),
        const SizedBox(width: 16),

        Expanded(
          child: Column(
            children: [
              ///
              /// TITLE
              ///
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: context.textStyles.appBarTitle,
              ),

              ///
              /// SUBTITLE
              ///
              if (subtitle?.isNotEmpty ?? false)
                Text(
                  subtitle!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: context.textStyles.appBarSubtitle,
                ),
            ],
          ),
        ),

        ///
        /// EMPTY SPACE
        ///
        const SizedBox(width: 16),
        BoneveraDrawerButton(
          onPressed: () {},
          isHidden: true,
        ),
      ],
    ),
  );
}
