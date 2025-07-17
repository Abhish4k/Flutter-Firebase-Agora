import 'package:flutter/material.dart';
import 'package:flutter_agora_video_call/utils/app_color.dart';

appTextStyle({
  required double fontSize,
  Color? colour,
  FontWeight fontWeight = FontWeight.normal,
  FontStyle fontStyle = FontStyle.normal,
  TextDecoration? textDecoration,
  TextOverflow? textOverflow,
  double height = 0.0,
}) => TextStyle(
  decoration: textDecoration,
  overflow: textOverflow,
  fontSize: fontSize,
  color: colour ?? AppColor.black,
  fontStyle: fontStyle,
  height: height,
  fontWeight: fontWeight,
  decorationColor: colour,
);
