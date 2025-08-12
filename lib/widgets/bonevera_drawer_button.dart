import 'package:flutter/material.dart';

import '../constants/durations.dart';
import '../theme/icons.dart';
import '../theme/theme.dart';
import 'bonevera_button.dart';

class BoneveraDrawerButton extends StatelessWidget {
  final Function() onPressed;
  final String icon;
  final Color? iconColor;
  final bool isHidden;
  final double angle;

  const BoneveraDrawerButton({
    required this.onPressed,
    this.icon = BoneveraIcons.drawer,
    this.isHidden = false,
    this.iconColor,
    this.angle = 0,
  });

  @override
  Widget build(BuildContext context) => IgnorePointer(
    ignoring: isHidden,
    child: AnimatedOpacity(
      duration: BoneveraDurations.fadeAnimation,
      curve: Curves.easeIn,
      opacity: isHidden ? 0 : 1,
      child: BoneveraButton(
        onPressed: onPressed,
        child: IconButton(
          onPressed: null,
          padding: const EdgeInsets.all(18),
          style: IconButton.styleFrom(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            backgroundColor: context.colors.appBarDaysBackground,
            disabledBackgroundColor: context.colors.appBarDaysBackground,
            overlayColor: Colors.transparent,
          ),
          icon: Transform.rotate(
            angle: angle,
            child: Image.asset(
              icon,
              height: 20,
              width: 20,
              color: iconColor ?? context.colors.appBarText,
            ),
          ),
        ),
      ),
    ),
  );
}
