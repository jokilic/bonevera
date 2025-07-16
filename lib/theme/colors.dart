import 'package:flutter/material.dart';

abstract class CJVnkColors {
  static const white = Color(0xFFDFECFB);
  static const black = Color(0xFF342464);
  static const blue = Color(0xFF74AEDE);
}

class CJVnkColorsExtension extends ThemeExtension<CJVnkColorsExtension> {
  final Color white;
  final Color black;
  final Color blue;

  CJVnkColorsExtension({
    required this.white,
    required this.black,
    required this.blue,
  });

  @override
  ThemeExtension<CJVnkColorsExtension> copyWith({
    Color? white,
    Color? black,
    Color? blue,
  }) => CJVnkColorsExtension(
    white: white ?? this.white,
    black: black ?? this.black,
    blue: blue ?? this.blue,
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
      white: Color.lerp(white, other.white, t)!,
      black: Color.lerp(black, other.black, t)!,
      blue: Color.lerp(blue, other.blue, t)!,
    );
  }
}
