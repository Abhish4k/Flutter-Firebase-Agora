import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_agora_video_call/utils/app_color.dart';

AppBar appBarWithWhiteStatusBar = AppBar(
  toolbarHeight: 0.0,
  backgroundColor: AppColor.white,
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: AppColor.white,
    statusBarIconBrightness: Platform.isIOS
        ? Brightness.light
        : Brightness.dark,
    statusBarBrightness: Platform.isIOS ? Brightness.light : Brightness.dark,
  ),
);

AppBar appBarWithThemeStatusBar = AppBar(
  toolbarHeight: 0.0,
  backgroundColor: AppColor.themeColor,
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: AppColor.themeColor,
    statusBarIconBrightness: Platform.isIOS
        ? Brightness.dark
        : Brightness.light,
    statusBarBrightness: Platform.isIOS ? Brightness.dark : Brightness.light,
  ),
);

AppBar appBarWithTransparentStatusBar = AppBar(
  toolbarHeight: 0.0,
  backgroundColor: AppColor.transparent,
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: AppColor.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
  ),
);
