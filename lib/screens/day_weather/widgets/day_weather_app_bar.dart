import 'dart:math';

import 'package:flutter/material.dart';

import '../../../theme/icons.dart';
import '../../../theme/theme.dart';
import '../../../widgets/cjvnk_drawer_button.dart';

class DayWeatherAppBar extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Function() onPressedBack;

  const DayWeatherAppBar({
    required this.title,
    required this.onPressedBack,
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
        CJVnkDrawerButton(
          onPressed: onPressedBack,
          icon: CJVnkIcons.arrow,
          angle: pi,
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
        CJVnkDrawerButton(
          onPressed: () {},
          isHidden: true,
        ),
      ],
    ),
  );
}
