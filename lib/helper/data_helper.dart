import 'dart:developer';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter_agora_video_call/utils/app_color.dart';
import 'package:flutter_agora_video_call/utils/app_const_size.dart';
import 'package:flutter_agora_video_call/utils/app_text_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class DataHelper {
  static logValue(String key, dynamic value) {
    log("$key: $value");
  }

  static RxBool isLoading = false.obs;
  static Future<bool> checkUserConnection() async {
    RxBool activeConnection = false.obs;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        activeConnection.value = true;
      }
    } on SocketException catch (_) {
      activeConnection.value = false;
    }
    return activeConnection.value;
  }

  static showAppToast({required String message, required Color bkgColor}) {
    if (message.isNotEmpty) {
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: bkgColor,
        textColor: AppColor.white,
        fontSize: AppConstSize.size12,
      );
    }
  }

  static bool emailValidation(String email) {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email);
  }

  static bool passwordValidation(String password) {
    return RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$',
    ).hasMatch(password);
  }

  static clearControllers() {
    emailController.clear();
    passwordController.clear();
  }
}
