import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_agora_video_call/app_Routes/routes.dart';
import 'package:flutter_agora_video_call/app_enums/auth_enums/auth_enums.dart';
import 'package:flutter_agora_video_call/app_mixins/auth_mixin/auth_mixin.dart';
import 'package:flutter_agora_video_call/app_mixins/dashboard_mixin/dashboard_mixin.dart';
import 'package:flutter_agora_video_call/app_models/auth_request_model.dart';
import 'package:flutter_agora_video_call/helper/data_helper.dart';
import 'package:flutter_agora_video_call/utils/app_color.dart';
import 'package:flutter_agora_video_call/utils/app_validation.dart';
import 'package:get/get.dart';

class AppClickListeners {
  // Auth Screen Switches
  static goToSignInScreen() {
    AuthMixin.setAuthEnum = AuthEnum.signIn;
    DataHelper.logValue("key", AuthMixin.getAuthEnum.value);
  }

  static goToSignUpScreen() {
    AuthMixin.setAuthEnum = AuthEnum.signUp;
    DataHelper.logValue("key", AuthMixin.getAuthEnum.value);
  }

  static goToForgetPasswordScreen() {
    AuthMixin.setAuthEnum = AuthEnum.forgetPassword;
    DataHelper.logValue("key", AuthMixin.getAuthEnum.value);
  }

  static goToVerifyOtpScreen() {
    AuthMixin.setAuthEnum = AuthEnum.verifyOtp;
    DataHelper.logValue("key", AuthMixin.getAuthEnum.value);
  }

  static goToResetPasswordScreen() {
    AuthMixin.setAuthEnum = AuthEnum.resetPassword;
    DataHelper.logValue("key", AuthMixin.getAuthEnum.value);
  }

  static goToDashboardScreen() {
    Get.offAllNamed(Routes.dashboardScreen);
  }

  // Auth Screen Button Taps
  static onSignInButtonTap({required AuthRequestModel authRequestModel}) async {
    if (AppValidations.validateSignIn(authRequestModel: authRequestModel)) {
      try {
        await AuthMixin.signInWithEmailAndPassword(
          authRequestModel: authRequestModel,
        );
        await DashboardMixin.callGetPostsApi();
        DataHelper.logValue("PostList", DashboardMixin.getPostsList.length);
        goToDashboardScreen();
      } on FirebaseException catch (e) {
        DataHelper.showAppToast(
          message: e.message.toString(),
          bkgColor: AppColor.dotColor,
        );
        DataHelper.logValue("key", e.toString());
      }
    }
    DataHelper.clearControllers();
  }

  static onSignUpButtonTap({required AuthRequestModel authRequestModel}) async {
    if (AppValidations.validateSignUp(authRequestModel: authRequestModel)) {
      try {
        await AuthMixin.signUpWithEmailAndPassword(
          authRequestModel: authRequestModel,
        );
        AuthMixin.setAuthEnum = AuthEnum.signIn;
      } on FirebaseException catch (e) {
        DataHelper.logValue("key", e.toString());
      }
    }
    DataHelper.clearControllers();
  }

  static onForgetPasswordConfirmButtonTap() {
    AuthMixin.setAuthEnum = AuthEnum.verifyOtp;
  }

  static onVerifyOtpButtonTap() {}

  static onResetPasswordButtonTap() {}
}
