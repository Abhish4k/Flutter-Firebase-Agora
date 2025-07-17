import 'package:flutter/material.dart';

double appWidth({required BuildContext context}) =>
    MediaQuery.of(context).size.width;
double appHeight({required BuildContext context}) =>
    MediaQuery.of(context).size.height;

class AppTextSize {
  static double extraSmallTextSize({required BuildContext context}) =>
      appWidth(context: context) > 1000 ? 12.0 : 10.0;
  static double smallTextSize({required BuildContext context}) =>
      appWidth(context: context) > 1000 ? 14.0 : 12.0;
  static double idealTextSize({required BuildContext context}) =>
      appWidth(context: context) > 1000 ? 16.0 : 14.0;
  static double normalTextSize({required BuildContext context}) =>
      appWidth(context: context) > 1000 ? 18.0 : 16.0;
  static double mediumTextSize({required BuildContext context}) =>
      appWidth(context: context) > 1000 ? 20.0 : 18.0;
  static double largeTextSize({required BuildContext context}) =>
      appWidth(context: context) > 1000 ? 22.0 : 20.0;
  static double extraLargeTextSize({required BuildContext context}) =>
      appWidth(context: context) > 1000 ? 24.0 : 22.0;
  static double largeSize({required BuildContext context}) =>
      appWidth(context: context) > 1000 ? 30.0 : 28.0;
  static double headerText({required BuildContext context}) =>
      appWidth(context: context) > 1000 ? 38.0 : 36.0;
  static double extremeLargeTextSize({required BuildContext context}) =>
      appWidth(context: context) > 1000 ? 40.0 : 38.0;
}
