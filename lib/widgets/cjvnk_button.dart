import 'package:flutter/material.dart';

import '../constants/durations.dart';

class CJVnkButton extends StatefulWidget {
  final Widget child;
  final Function()? onPressed;
  final Function()? onLongPressed;

  const CJVnkButton({
    required this.child,
    this.onPressed,
    this.onLongPressed,
    super.key,
  });

  @override
  State<CJVnkButton> createState() => _CJVnkButtonState();
}

class _CJVnkButtonState extends State<CJVnkButton> with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: CJVnkDurations.buttonAnimation,
    );

    animation = Tween<double>(begin: 1, end: 0.95).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onTapDown(TapDownDetails details) {
    controller.forward();
  }

  void onTapUp(TapUpDetails details) {
    controller
      ..forward()
      ..reverse();

    if (widget.onPressed != null) {
      widget.onPressed!();
    }
  }

  void onTapCancel() {
    controller.reverse();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTapDown: widget.onPressed != null || widget.onLongPressed != null ? onTapDown : null,
    onTapUp: widget.onPressed != null || widget.onLongPressed != null ? onTapUp : null,
    onTapCancel: widget.onPressed != null || widget.onLongPressed != null ? onTapCancel : null,
    onLongPress: widget.onLongPressed,
    child: AnimatedBuilder(
      animation: animation,
      builder: (_, child) => Transform.scale(
        scale: animation.value,
        child: child,
      ),
      child: widget.child,
    ),
  );
}
