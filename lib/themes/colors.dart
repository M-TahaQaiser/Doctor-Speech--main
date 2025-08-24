import 'package:flutter/material.dart';

Color kPrimaryColor = const Color(0xff672D92);
MaterialColor kPrimarySwatchColor = MaterialColor(
  kPrimaryColor.value,
  <int, Color>{
    50: const Color(0xfff2eef9),
    100: const Color(0xffd9ccec),
    200: const Color(0xffbfabdf),
    300: const Color(0xffa589d3),
    400: const Color(0xff8c67c6),
    500: kPrimaryColor,
    600: const Color(0xff7246b9),
    700: const Color(0xff5e3998),
    800: const Color(0xff492c76),
    900: const Color(0xff342054),
    1000: const Color(0xff1f1332),
  },
);

Color kSecondaryColor = const Color(0xffFE8235);
MaterialColor kSecondarySwatchColor = MaterialColor(
  kSecondaryColor.value,
  <int, Color>{
    50: const Color(0xffFEF3E7),
    100: const Color(0xfffeb88c),
    200: const Color(0xffF09E54),
    300: const Color(0xfffe9b5e),
    400: const Color(0xfffe7f2f),
    500: kSecondaryColor,
    600: const Color(0xffd05001),
    700: const Color(0xffa13e01),
    800: const Color(0xff732d01),
    900: const Color(0xff573926),
    1000: const Color(0xff170900),
  },
);

Color kDarkColor = const Color(0xff292D32);
Color kLightColor = const Color(0xffFFFFFF);
Color kScaffoldBackgroundColor = const Color(0xffFAFAFA);
Color kTextColor = const Color(0xffB3BECD);
Color kLightTextColor = const Color(0xffF8F6F5);
Color kDividerColor = const Color(0xffD9D8D8);
Color kTransparentColor = Colors.transparent;
