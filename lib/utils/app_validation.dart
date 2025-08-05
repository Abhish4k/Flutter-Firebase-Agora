import 'package:flutter_agora_video_call/app_models/app_request_models/auth_request_model.dart';
import 'package:flutter_agora_video_call/helper/data_helper.dart';
import 'package:flutter_agora_video_call/utils/app_color.dart';
import 'package:flutter_agora_video_call/utils/app_strings.dart';

class AppValidations {
  // Sign Up Screen Validation Function
  static bool validateSignUp({required AuthRequestModel authRequestModel}) {
    if (authRequestModel.email.isEmpty) {
      DataHelper.showAppToast(
        bkgColor: AppColor.dotColor,
        message: AppStrings.pleaseEnterEmail,
      );
      return false;
    } else if (!DataHelper.emailValidation(authRequestModel.email)) {
      DataHelper.showAppToast(
        bkgColor: AppColor.dotColor,
        message: AppStrings.pleaseEnterValidEmail,
      );
      return false;
    } else if (!DataHelper.passwordValidation(authRequestModel.password)) {
      DataHelper.showAppToast(
        bkgColor: AppColor.dotColor,
        message: AppStrings.passMustHaveSpecialCharLetterNumber,
      );
      return false;
    } else if (authRequestModel.password.isEmpty) {
      DataHelper.showAppToast(
        bkgColor: AppColor.dotColor,
        message: AppStrings.pleaseEnterPassword,
      );
      return false;
    }
    DataHelper.showAppToast(
      bkgColor: AppColor.dotColor,
      message: AppStrings.accHasBeenCreatedSucessfully,
    );
    return true;
  }

  // Sign In Screen Validation Function
  static bool validateSignIn({required AuthRequestModel authRequestModel}) {
    if (authRequestModel.email.isEmpty) {
      DataHelper.showAppToast(
        bkgColor: AppColor.dotColor,
        message: AppStrings.pleaseEnterEmail,
      );
      return false;
    } else if (!DataHelper.emailValidation(authRequestModel.email)) {
      DataHelper.showAppToast(
        bkgColor: AppColor.dotColor,
        message: AppStrings.pleaseEnterValidEmail,
      );
      return false;
    } else if (authRequestModel.password.isEmpty) {
      DataHelper.showAppToast(
        bkgColor: AppColor.dotColor,
        message: AppStrings.pleaseEnterPassword,
      );
      return false;
    }
    return true;
  }
}
