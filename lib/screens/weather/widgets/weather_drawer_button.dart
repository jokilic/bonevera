import 'package:flutter/material.dart';

import '../../../theme/icons.dart';
import '../../../theme/theme.dart';

class WeatherDrawerButton extends StatelessWidget {
  final Function() onPressed;
  final bool isHidden;

  const WeatherDrawerButton({
    required this.onPressed,
    this.isHidden = false,
  });

  @override
  Widget build(BuildContext context) => IgnorePointer(
    ignoring: isHidden,
    child: Opacity(
      opacity: isHidden ? 0 : 1,
      child: IconButton(
        onPressed: onPressed,
        padding: const EdgeInsets.all(18),
        style: IconButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: context.colors.white.withValues(alpha: 0.3),
          overlayColor: context.colors.white,
        ),
        icon: Image.asset(
          CJVnkIcons.drawer,
          height: 20,
          width: 20,
          color: context.colors.black,
        ),
      ),
    ),
  );
}
