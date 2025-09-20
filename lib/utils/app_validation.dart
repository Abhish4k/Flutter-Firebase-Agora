import 'package:flutter_agora_video_call/app_models/app_request_models/auth_request_model.dart';
import 'package:flutter_agora_video_call/helper/data_helper.dart';
import 'package:flutter_agora_video_call/utils/app_color.dart';
import 'package:flutter_agora_video_call/utils/app_strings.dart';

class AppValidations {
  // Sign Up Screen Validation Function
  static bool validateSignUp({required AuthRequestModel authRequestModel}) {
    if (authRequestModel.firstName.isEmpty) {
      DataHelper.showAppToast(
        bkgColor: AppColor.dotColor,
        message: AppStrings.pleaseEnterFirstName,
      );
      return false;
    } else if (authRequestModel.lastName.isEmpty) {
      DataHelper.showAppToast(
        bkgColor: AppColor.dotColor,
        message: AppStrings.pleaseEnterLastName,
      );
      return false;
    } else if (authRequestModel.email.isEmpty) {
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
    } else if (authRequestModel.phoneNumber.isEmpty) {
      DataHelper.showAppToast(
        bkgColor: AppColor.dotColor,
        message: AppStrings.pleaseEnterPhoneNumber,
      );
      return false;
    } else if (!DataHelper.phoneNumberValidation(
      authRequestModel.phoneNumber,
    )) {
      DataHelper.showAppToast(
        bkgColor: AppColor.dotColor,
        message: AppStrings.pleaseEnterAValidPhoneNumber,
      );
      return false;
    } else if (authRequestModel.dob.isEmpty) {
      DataHelper.showAppToast(
        bkgColor: AppColor.dotColor,
        message: AppStrings.pleaseEnterDob,
      );
      return false;
    } else if (authRequestModel.password.isEmpty) {
      DataHelper.showAppToast(
        bkgColor: AppColor.dotColor,
        message: AppStrings.pleaseEnterPassword,
      );
      return false;
    } else if (!DataHelper.passwordValidation(authRequestModel.password)) {
      DataHelper.showAppToast(
        bkgColor: AppColor.dotColor,
        message: AppStrings.pleaseEnterAValidPassword,
      );
      return false;
    } else if (authRequestModel.confPass.isEmpty) {
      DataHelper.showAppToast(
        bkgColor: AppColor.dotColor,
        message: AppStrings.pleaseEnterConfPass,
      );
      return false;
    } else if (authRequestModel.password != authRequestModel.confPass) {
      DataHelper.showAppToast(
        bkgColor: AppColor.dotColor,
        message: AppStrings.passwordDidNotMatch,
      );
      return false;
    }
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
