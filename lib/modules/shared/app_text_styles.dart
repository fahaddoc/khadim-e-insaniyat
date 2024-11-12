import 'package:khadim_e_insaniyat/assets_gen/fonts.gen.dart';
import 'package:flutter/material.dart';

typedef AppTextStyleCategory = TextStyle Function(Color);

class AppTextStyles {
  static String get _primaryFontFamily => FontFamily.poppins;

  static TextStyle c12(Color color) => TextStyle(
        fontFamily: _primaryFontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: color,
      );

  static TextStyle c10(Color color) => TextStyle(
        fontFamily: _primaryFontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 10,
        color: color,
      );

  static TextStyle l10(Color color) => TextStyle(
        fontFamily: _primaryFontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 10,
        color: color,
      );

  static TextStyle l12(Color color) => TextStyle(
        fontFamily: _primaryFontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: color,
      );

  static TextStyle t10(Color color) => TextStyle(
        fontFamily: _primaryFontFamily,
        fontWeight: FontWeight.w600,
        fontSize: 10,
        color: color,
      );

  static TextStyle t13(Color color) => TextStyle(
        fontFamily: _primaryFontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 13,
        color: color,
      );

  static TextStyle t14(Color color) => TextStyle(
        fontFamily: _primaryFontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: color,
      );

  static TextStyle t16(Color color) => TextStyle(
        fontFamily: _primaryFontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: color,
      );

  static TextStyle t18(Color color) => TextStyle(
        fontFamily: _primaryFontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: color,
      );

  static TextStyle b13(Color color) => TextStyle(
        fontFamily: _primaryFontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 13,
        color: color,
      );

  static TextStyle b14(Color color) => TextStyle(
        fontFamily: _primaryFontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: color,
      );

  static TextStyle b16(Color color) => TextStyle(
        fontFamily: _primaryFontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: color,
      );

  static TextStyle u10(Color color) => TextStyle(
        fontFamily: _primaryFontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 10,
        color: color,
      );

  static TextStyle h20(Color color) => TextStyle(
        fontFamily: _primaryFontFamily,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: color,
      );

  static TextStyle h24(Color color) => TextStyle(
        fontFamily: _primaryFontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 24,
        color: color,
      );

  static TextStyle h32(Color color) => TextStyle(
        fontFamily: _primaryFontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 32,
        color: color,
      );

  static TextStyle h40(Color color) => TextStyle(
        fontFamily: _primaryFontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 40,
        color: color,
      );

  static TextStyle custom({required double fontSize, required FontWeight fontWeight, required Color color, double? height}) =>
      TextStyle(
        fontFamily: _primaryFontFamily,
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
        height: height,
      );
}
