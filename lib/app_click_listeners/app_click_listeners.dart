import 'package:flutter_agora_video_call/app_Routes/routes.dart';
import 'package:flutter_agora_video_call/app_enums/auth_enums/auth_enums.dart';
import 'package:flutter_agora_video_call/app_mixins/auth_mixin/auth_mixin.dart';
import 'package:flutter_agora_video_call/app_models/app_request_models/auth_request_model.dart';
import 'package:flutter_agora_video_call/helper/data_helper.dart';
import 'package:flutter_agora_video_call/main.dart';
import 'package:flutter_agora_video_call/utils/app_color.dart';
import 'package:flutter_agora_video_call/utils/app_strings.dart';
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
  static onSignInButtonTap({
    required String email,
    required String password,
  }) async {
    // await DashboardMixin.callGetPostsApi();
    // DataHelper.logValue("PostList", DashboardMixin.getPostsList.length);
    if (AppValidations.validateSignIn(
      authRequestModel: AuthRequestModel(email: email, password: password),
    )) {
      final user = await AuthMixin.signInWithEmailAndPassword(
        authRequestModel: AuthRequestModel(email: email, password: password),
      );
      DataHelper.logValue("userValue", user);
      DataHelper.clearControllers();
      if (user != null) {
        DataHelper.showAppToast(
          message: AppStrings.loginSucessfully,
          bkgColor: AppColor.dotColor,
        );
        goToDashboardScreen();
      }
    }
  }

  static onSignUpButtonTap({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String dob,
    required String phoneNo,
    required String confPass,
  }) async {
    if (AppValidations.validateSignUp(
      authRequestModel: AuthRequestModel(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        dob: dob,
        phoneNumber: phoneNo,
        confPass: confPass,
      ),
    )) {
      final user = await AuthMixin.signUpWithEmailAndPassword(
        authRequestModel: AuthRequestModel(
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName,
          dob: dob,
          phoneNumber: phoneNo,
          confPass: confPass,
        ),
      );
      DataHelper.clearControllers();
      if (user != null) {
        AuthMixin.setAuthEnum = AuthEnum.signIn;
        DataHelper.showAppToast(
          message: AppStrings.accHasBeenCreatedSucessfully,
          bkgColor: AppColor.dotColor,
        );
      }
    }
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
