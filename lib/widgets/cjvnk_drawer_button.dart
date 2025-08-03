import 'package:flutter/material.dart';

import '../constants/durations.dart';
import '../theme/icons.dart';
import '../theme/theme.dart';
import 'cjvnk_button.dart';

class CJVnkDrawerButton extends StatelessWidget {
  final Function() onPressed;
  final String icon;
  final Color? iconColor;
  final bool isHidden;

  const CJVnkDrawerButton({
    required this.onPressed,
    this.icon = CJVnkIcons.drawer,
    this.isHidden = false,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) => IgnorePointer(
    ignoring: isHidden,
    child: AnimatedOpacity(
      duration: CJVnkDurations.fadeAnimation,
      curve: Curves.easeIn,
      opacity: isHidden ? 0 : 1,
      child: CJVnkButton(
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
          icon: Image.asset(
            icon,
            height: 20,
            width: 20,
            color: iconColor ?? context.colors.appBarText,
          ),
        ),
      ),
    ),
  );
}
