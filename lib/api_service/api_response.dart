import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_agora_video_call/helper/data_helper.dart';
import 'package:flutter_agora_video_call/utils/app_strings.dart';

class ApiResponse {
  int code = 0;
  dynamic body;
  String errorMessage = "";

  bool get isSuccessful {
    return code == 200 || code == 201;
  }

  bool get totallyNoRecord {
    return code == 500 || code == 400 || code == 404;
  }

  ApiResponse(Response response) {
    code = response.statusCode!;
    if (isSuccessful) {
      body = response.data!;
      errorMessage = '';
    } else if (totallyNoRecord) {
      body = null;
      errorMessage = AppStrings.noRecord;
    } else {
      try {
        final dynamic hashMap = json.decode(response.data!);
        DataHelper.logValue("", hashMap['message']);
        errorMessage = hashMap['message'];
      } catch (error) {
        DataHelper.logValue("", AppStrings.timeoutError);
      }
      errorMessage = AppStrings.timeoutError;
    }
  }
}
