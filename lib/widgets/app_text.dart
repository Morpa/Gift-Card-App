import 'package:flutter/material.dart';

import '../gen/colors.gen.dart';
import '../gen/fonts.gen.dart';

class AppText extends Text {
  final Color? color;
  final FontWeight? fontWeight;
  final double fontSize;

  AppText.title(
    String data, {
    super.key,
    this.color = ColorName.primaryColor,
    this.fontWeight = FontWeight.bold,
    this.fontSize = 26,
  }) : super(
          data,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: TextStyle(
            fontFamily: FontFamily.playfair,
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
          ),
        );

  AppText.large(
    String data, {
    super.key,
    this.color = ColorName.primaryColor,
    this.fontWeight = FontWeight.bold,
    this.fontSize = 24,
  }) : super(
          data,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: TextStyle(
            fontFamily: FontFamily.merriweather,
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
          ),
        );

  AppText.medium(
    String data, {
    super.key,
    this.color = ColorName.primaryColor,
    this.fontWeight = FontWeight.w600,
    this.fontSize = 14,
  }) : super(
          data,
          textAlign: TextAlign.left,
          maxLines: 1,
          style: TextStyle(
            fontFamily: FontFamily.merriweather,
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
          ),
        );

  AppText.small(
    String data, {
    super.key,
    this.color = ColorName.primaryColor,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 12,
  }) : super(
          data,
          textAlign: TextAlign.left,
          maxLines: 1,
          style: TextStyle(
            fontFamily: FontFamily.merriweather,
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
          ),
        );
}
