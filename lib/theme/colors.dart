import 'package:flutter/material.dart';

abstract class CJVnkColors {
  static const white = Color(0xFFDFECFB);
  static const black = Color(0xFF342464);
  static const blue = Color(0xFF74AEDE);
}

class CJVnkColorsExtension extends ThemeExtension<CJVnkColorsExtension> {
  final Color background;
  final Color primary;
  final Color accent;

  CJVnkColorsExtension({
    required this.background,
    required this.primary,
    required this.accent,
  });

  @override
  ThemeExtension<CJVnkColorsExtension> copyWith({
    Color? background,
    Color? primary,
    Color? accent,
  }) => CJVnkColorsExtension(
    background: background ?? this.background,
    primary: primary ?? this.primary,
    accent: accent ?? this.accent,
  );

  @override
  ThemeExtension<CJVnkColorsExtension> lerp(
    covariant ThemeExtension<CJVnkColorsExtension>? other,
    double t,
  ) {
    if (other is! CJVnkColorsExtension) {
      return this;
    }

    return CJVnkColorsExtension(
      background: Color.lerp(background, other.background, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
    );
  }
}
