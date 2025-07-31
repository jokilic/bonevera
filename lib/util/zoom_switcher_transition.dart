import 'package:flutter/material.dart';

extension AnimationStatusExtension on AnimationStatus {
  bool get isReversed => this == AnimationStatus.completed || this == AnimationStatus.reverse;
}

class ZoomTransition extends AnimatedWidget {
  final Widget? child;
  final double scaleInFactor;
  final double scaleOutFactor;

  const ZoomTransition({
    required this.scaleInFactor,
    required this.scaleOutFactor,
    required Animation<double> listenable,
    this.child,
  }) : super(listenable: listenable);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    final isReversed = animation.status.isReversed;

    return ScaleTransition(
      scale: Tween<double>(
        begin: isReversed ? scaleOutFactor : scaleInFactor,
        end: 1,
      ).animate(animation),
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }
}
