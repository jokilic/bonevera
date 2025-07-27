import 'package:flutter/material.dart';

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
    child: Opacity(
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
            backgroundColor: context.colors.background.withValues(alpha: 0.3),
            disabledBackgroundColor: context.colors.background.withValues(alpha: 0.3),
            overlayColor: context.colors.background,
          ),
          icon: Image.asset(
            icon,
            height: 20,
            width: 20,
            color: iconColor ?? context.colors.primary,
          ),
        ),
      ),
    ),
  );
}
