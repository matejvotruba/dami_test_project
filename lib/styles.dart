import 'package:flutter/material.dart';

abstract class FigmaColors {
  static const damiGrass = Color(0xff80ce1b);
  static const baliBlue = Color(0xff061f35);
  static const white = Color(0xffffffff);
  static const lightBlue = Color(0xff9ba5ae);
}

abstract class FigmaEffectStyles {
  static const boxShadow = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.25),
    blurRadius: 4,
    offset: Offset(0, 4),
  );
}

abstract class FigmaTextStyles {
  static const displayLarge = TextStyle(
    fontSize: 57,
    decoration: TextDecoration.none,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    height: 64 / 57,
    letterSpacing: -0.25,
  );

  static const displayMedium = TextStyle(
    fontSize: 45,
    decoration: TextDecoration.none,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    height: 52 / 45,
    letterSpacing: 0,
  );

  static const displaySmall = TextStyle(
    fontSize: 36,
    decoration: TextDecoration.none,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    height: 44 / 36,
    letterSpacing: 0,
  );

  static const headlineLarge = TextStyle(
    fontSize: 32,
    decoration: TextDecoration.none,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    height: 40 / 32,
    letterSpacing: 0,
  );

  static const headlineMedium = TextStyle(
    fontSize: 28,
    decoration: TextDecoration.none,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    height: 36 / 28,
    letterSpacing: 0,
  );

  static const headlineSmall = TextStyle(
    fontSize: 24,
    decoration: TextDecoration.none,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    height: 32 / 24,
    letterSpacing: 0,
  );

  static const titleLarge = TextStyle(
    fontSize: 22,
    decoration: TextDecoration.none,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    height: 28 / 22,
    letterSpacing: 0,
  );

  static const titleMedium = TextStyle(
    fontSize: 16,
    decoration: TextDecoration.none,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    height: 24 / 16,
    letterSpacing: 0,
  );

  static const titleSmall = TextStyle(
    fontSize: 14,
    decoration: TextDecoration.none,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    height: 20 / 14,
    letterSpacing: 0,
  );

  static const labelLarge = TextStyle(
    fontSize: 14,
    decoration: TextDecoration.none,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    height: 20 / 14,
    letterSpacing: 0,
  );

  static const labelMedium = TextStyle(
    fontSize: 12,
    decoration: TextDecoration.none,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    height: 16 / 12,
    letterSpacing: 0.5,
  );

  static const labelSmall = TextStyle(
    fontSize: 11,
    decoration: TextDecoration.none,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    height: 16 / 11,
    letterSpacing: 0,
  );

  static const bodyLarge = TextStyle(
    fontSize: 16,
    decoration: TextDecoration.none,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    height: 24 / 16,
    letterSpacing: 0,
  );

  static const bodyMedium = TextStyle(
    fontSize: 14,
    decoration: TextDecoration.none,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    height: 20 / 14,
    letterSpacing: 0,
  );

  static const bodySmall = TextStyle(
    fontSize: 12,
    decoration: TextDecoration.none,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    height: 16 / 12,
    letterSpacing: 0.4,
  );
}

const kAppBarBorderRadius = BorderRadius.vertical(
  bottom: Radius.circular(8),
);
