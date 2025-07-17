import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_agora_video_call/utils/app_const_size.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget imageAsset({
  required String image,
  double width = AppConstSize.size50,
  double height = AppConstSize.size50,
  BoxFit boxFit = BoxFit.contain,
  Color? color,
}) =>
    Image.asset(image, width: width, height: height, color: color, fit: boxFit);

Widget imageFile({
  required File file,
  double width = AppConstSize.size50,
  double height = AppConstSize.size50,
  BoxFit boxFit = BoxFit.contain,
  Color? color,
}) => Image.file(file, width: width, height: height, color: color, fit: boxFit);

Widget svgAsset({
  required String image,
  double width = AppConstSize.size50,
  double height = AppConstSize.size50,
  BoxFit boxFit = BoxFit.none,
  Color? color,
}) => SvgPicture.asset(
  image,
  width: width,
  height: height,
  color: color,
  fit: boxFit,
);

Widget fileImage({
  required File file,
  double width = AppConstSize.size50,
  double height = AppConstSize.size50,
  BoxFit boxFit = BoxFit.contain,
  Color? color,
}) => Image.file(file, width: width, height: height, color: color, fit: boxFit);
