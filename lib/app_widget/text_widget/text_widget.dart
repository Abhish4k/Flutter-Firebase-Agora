import 'package:flutter/material.dart';
import 'package:flutter_agora_video_call/app_extensions/highlighted_extension.dart';
import 'package:flutter_agora_video_call/utils/app_color.dart';
import 'package:flutter_agora_video_call/utils/app_const_size.dart';
import 'package:flutter_agora_video_call/utils/app_text_style.dart';

Widget textWidget({
  required String text,
  String highLightText = "",
  Color colour = AppColor.black,
  double fontSize = AppConstSize.size14,
  Color highLightColor = AppColor.black,
  TextAlign alignment = TextAlign.start,
  int? maxLine,
  TextDecoration? textDecoration,
  bool isHighLighted = false,
  TextOverflow? textOverflow,
  FontWeight fontWeight = FontWeight.normal,
  FontStyle fontStyle = FontStyle.normal,
  double height = 1.5,
}) => isHighLighted
    ? Text(
        text,
        textAlign: alignment,
        maxLines: maxLine,
        style: appTextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          colour: colour,
          height: height,
          fontStyle: fontStyle,
          textDecoration: textDecoration,
          textOverflow: textOverflow,
        ),
      ).boldSubString(
        target: highLightText,
        fontSize: fontSize,
        align: alignment,
        textColor: colour,
        highLightColor: highLightColor,
        fontWeight: fontWeight,
      )
    : Text(
        text,
        textAlign: alignment,
        maxLines: maxLine,
        style: appTextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          colour: colour,
          height: height,
          fontStyle: fontStyle,
          textDecoration: textDecoration,
          textOverflow: textOverflow,
        ),
      );
