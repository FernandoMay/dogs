import 'package:flutter/material.dart';

const color66 = Color(0xFF666666);
const color33 = Color(0xFF333333);
const colorf8 = Color(0xFFF8F8F8);

MaterialColor createMaterialColor(Color color) {
  final int r = color.red, g = color.green, b = color.blue;

  Map<int, Color> shades = {};
  for (int i = 1; i <= 10; i++) {
    shades[i * 100] = Color.fromRGBO(r, g, b, 1.0 - 0.1 * i);
  }

  return MaterialColor(color.value, shades);
}