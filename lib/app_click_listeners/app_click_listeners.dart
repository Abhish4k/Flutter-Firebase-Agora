import 'package:flutter_agora_video_call/app_Routes/routes.dart';
import 'package:flutter_agora_video_call/app_enums/auth_enums/auth_enums.dart';
import 'package:flutter_agora_video_call/app_enums/dashboard_enum/quick_actions_enum.dart';
import 'package:flutter_agora_video_call/app_mixins/auth_mixin/auth_mixin.dart';
import 'package:flutter_agora_video_call/app_mixins/dashboard_mixin/dashboard_mixin.dart';
import 'package:flutter_agora_video_call/helper/data_helper.dart';
import 'package:flutter_agora_video_call/main.dart';
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

  static goToQuickActionsScreen() {
    Get.offAllNamed(Routes.homeSubScreen);
    DataHelper.logValue(
      "QucickActionEnum",
      dashboardController.getQuickActionsEnum.value,
    );
  }

  // Auth Screen Button Taps
  static onSignInButtonTap() async {
    await DashboardMixin.callGetPostsApi();
    DataHelper.logValue("PostList", DashboardMixin.getPostsList.length);
    goToDashboardScreen();
    DataHelper.clearControllers();
  }

  static onSignUpButtonTap() {
    AuthMixin.setAuthEnum = AuthEnum.signIn;
    DataHelper.clearControllers();
  }

  static onForgetPasswordConfirmButtonTap() {
    AuthMixin.setAuthEnum = AuthEnum.verifyOtp;
  }

  static onVerifyOtpButtonTap() {
    AuthMixin.setAuthEnum = AuthEnum.resetPassword;
  }

  static onResetPasswordButtonTap() {
    AuthMixin.setAuthEnum = AuthEnum.signIn;
  }
}
