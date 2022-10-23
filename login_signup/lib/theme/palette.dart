import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor kToDark = MaterialColor(
    0xff6396c5, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff73a1cb),
      100: Color(0xff82abd1),
      200: Color(0xff92b6d6),
      300: Color(0xffa1c0dc),
      400: Color(0xffb1cbe2),
      500: Color(0xffc1d5e8),
      600: Color(0xffd0e0ee),
      700: Color(0xffe0eaf3),
      800: Color(0xffeff5f9),
      900: Color(0xffffffff),
    },
  );
  static const List<Color> lightColors = [
    Color(0xff73a1cb),
    Color(0xff82abd1),
    Color(0xff92b6d6),
    Color(0xffa1c0dc),
    Color(0xffb1cbe2),
    Color(0xffc1d5e8),
    Color(0xffd0e0ee),
    Color(0xffe0eaf3),
    Color(0xffeff5f9)
  ];
}
