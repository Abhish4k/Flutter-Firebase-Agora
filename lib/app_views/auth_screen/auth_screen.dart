import 'package:flutter/material.dart';
import 'package:flutter_agora_video_call/app_click_listeners/app_click_listeners.dart';
import 'package:flutter_agora_video_call/app_enums/auth_enums/auth_enums.dart';
import 'package:flutter_agora_video_call/app_mixins/auth_mixin/auth_mixin.dart';
import 'package:flutter_agora_video_call/app_views/auth_screen/auth_sub_screens/forget_password_screen.dart';
import 'package:flutter_agora_video_call/app_views/auth_screen/auth_sub_screens/reset_password_screen.dart';
import 'package:flutter_agora_video_call/app_views/auth_screen/auth_sub_screens/sign_up_screen.dart';
import 'package:flutter_agora_video_call/app_views/auth_screen/auth_sub_screens/sign_in_screen.dart';
import 'package:flutter_agora_video_call/app_views/auth_screen/auth_sub_screens/verify_otp_screen.dart';
import 'package:flutter_agora_video_call/app_widget/app_button/app_button.dart';
import 'package:flutter_agora_video_call/app_widget/text_widget/text_widget.dart';
import 'package:flutter_agora_video_call/utils/app_color.dart';
import 'package:flutter_agora_video_call/utils/app_const_size.dart';
import 'package:flutter_agora_video_call/utils/app_images.dart';
import 'package:flutter_agora_video_call/utils/app_status_bar.dart';
import 'package:flutter_agora_video_call/utils/app_strings.dart';
import 'package:flutter_agora_video_call/utils/app_text_sizes.dart';
import 'package:flutter_agora_video_call/utils/image_assets.dart';
import 'package:get/get.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.lightGreyOne,
      appBar: appBarWithWhiteStatusBar,
      body: Container(
        height: appHeight(context: context),
        width: appWidth(context: context),
        decoration: BoxDecoration(gradient: AppColor.primaryGradient),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstSize.size15,
                  vertical: AppConstSize.size40,
                ),
                child: Obx(
                  () => authTopWidget(
                    context: context,
                    desc: authDescText(authEnum: AuthMixin.getAuthEnum.value),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: AppConstSize.size15),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppConstSize.size35),
                  topRight: Radius.circular(AppConstSize.size35),
                ),
                boxShadow: kElevationToShadow[3],
              ),
              height: appHeight(context: context) / 1.5,
              width: appWidth(context: context),
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: appHeight(context: context) * 0.52,
                      child: SingleChildScrollView(
                        child: getAuthScreen(
                          authEnum: AuthMixin.getAuthEnum.value,
                        ),
                      ),
                    ),
                    authBottomWidget(
                      context: context,
                      onTap: getAuthButtonTap(
                        authEnum: AuthMixin.getAuthEnum.value,
                      ),
                      buttonText: getButtonText(
                        authEnum: AuthMixin.getAuthEnum.value,
                      ),
                      alredyhaveAccount:
                          AuthMixin.getAuthEnum.value == AuthEnum.signUp
                          ? true
                          : false,
                      doNotHaveAccount:
                          AuthMixin.getAuthEnum.value == AuthEnum.signIn
                          ? true
                          : false,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Changes the button text of the Auth Screens
  String getButtonText({required AuthEnum authEnum}) {
    switch (authEnum) {
      case AuthEnum.signUp:
        return AppStrings.signUp;
      case AuthEnum.signIn:
        return AppStrings.signIn;
      case AuthEnum.forgetPassword:
        return AppStrings.confirm;
      case AuthEnum.verifyOtp:
        return AppStrings.verifyOtp;
      case AuthEnum.resetPassword:
        return AppStrings.resetPassword;
    }
  }

  Function() getAuthButtonTap({required AuthEnum authEnum}) {
    switch (authEnum) {
      case AuthEnum.signUp:
        return () => AppClickListeners.onSignUpButtonTap();
      case AuthEnum.signIn:
        return () => AppClickListeners.onSignInButtonTap();
      case AuthEnum.forgetPassword:
        return () => AppClickListeners.onForgetPasswordConfirmButtonTap();
      case AuthEnum.verifyOtp:
        return () => AppClickListeners.onVerifyOtpButtonTap();
      case AuthEnum.resetPassword:
        return () => AppClickListeners.onResetPasswordButtonTap();
    }
  }

  // Changes the description text of the Auth Screens
  String authDescText({required AuthEnum authEnum}) {
    switch (authEnum) {
      case AuthEnum.signUp:
        return AppStrings.signUpMainDesc;
      case AuthEnum.signIn:
        return AppStrings.signInMainDesc;
      case AuthEnum.forgetPassword:
        return AppStrings.forgotPassMainDesc;
      case AuthEnum.verifyOtp:
        return AppStrings.verifyOtpMainDesc;
      case AuthEnum.resetPassword:
        return AppStrings.resetPasswordMainDesc;
    }
  }

  // Changes the Auth Screens based on the Auth Enum
  Widget getAuthScreen({required AuthEnum authEnum}) {
    Widget widget = SigninScreen();

    switch (authEnum) {
      case AuthEnum.signUp:
        widget = const SignUpScreen();
        break;
      case AuthEnum.signIn:
        widget = const SigninScreen();
        break;
      case AuthEnum.forgetPassword:
        widget = const ForgetPasswordScreen();
        break;
      case AuthEnum.verifyOtp:
        widget = const VerifyOtpScreen();
        break;
      case AuthEnum.resetPassword:
        widget = const ResetPasswordScreen();
        break;
    }
    return widget;
  }

  // Top widget of the Auth Screens that holds the back icon and the description text
  authTopWidget({required BuildContext context, required String desc}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        AuthMixin.getAuthEnum.value == AuthEnum.signIn
            ? SizedBox()
            : GestureDetector(
                onTap: () =>
                    onAuthBackPress(authEnum: AuthMixin.getAuthEnum.value),
                behavior: HitTestBehavior.translucent,
                child: imageAsset(
                  image: AppImages.backImg,
                  height: AppConstSize.size20,
                  width: AppConstSize.size20,
                  color: AppColor.white,
                ),
              ),
        AuthMixin.getAuthEnum.value == AuthEnum.signIn
            ? SizedBox(height: AppConstSize.size25)
            : SizedBox(height: AppConstSize.size15),
        Flexible(
          child: textWidget(
            text: desc,
            fontSize: AppConstSize.size24,
            fontWeight: FontWeight.bold,
            colour: AppColor.white,
          ),
        ),
      ],
    );
  }

  // Bottom widget of the Auth Screens that holds the button and the text that changes based on the Auth Enum
  authBottomWidget({
    required BuildContext context,
    required String buttonText,
    required Function() onTap,
    bool alredyhaveAccount = false,
    bool doNotHaveAccount = false,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        AppButton(
          text: buttonText,
          onTap: onTap,
          textColor: AppColor.white,
          fontWeight: FontWeight.bold,
        ),
        AuthMixin.getAuthEnum.value == AuthEnum.signIn ||
                AuthMixin.getAuthEnum.value == AuthEnum.signUp
            ? SizedBox(height: AppConstSize.size5)
            : SizedBox(height: AppConstSize.size30),
        doNotHaveAccount == true || alredyhaveAccount == true
            ? Padding(
                padding: EdgeInsetsGeometry.all(AppConstSize.size10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    textWidget(
                      text: doNotHaveAccount == true
                          ? AppStrings.doNotHaveAnAccount
                          : alredyhaveAccount == true
                          ? AppStrings.alreadyHaveAnAccount
                          : AppStrings.doNotHaveAnAccount,
                      fontSize: AppConstSize.size14,
                      colour: AppColor.grey,
                    ),
                    SizedBox(width: AppConstSize.size5),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () =>
                          AuthMixin.getAuthEnum.value == AuthEnum.signIn
                          ? AppClickListeners.goToSignUpScreen()
                          : AppClickListeners.goToSignInScreen(),
                      child: textWidget(
                        text: doNotHaveAccount == true
                            ? AppStrings.signUp
                            : alredyhaveAccount == true
                            ? AppStrings.signIn
                            : AppStrings.signUp,
                        fontSize: AppConstSize.size14,
                        fontWeight: FontWeight.bold,
                        colour: AppColor.dotColor,
                      ),
                    ),
                  ],
                ),
              )
            : SizedBox(),
      ],
    );
  }

  static Function()? onAuthBackPress({required AuthEnum authEnum}) {
    switch (authEnum) {
      case AuthEnum.signIn:
        return null;
      case AuthEnum.signUp:
        return AppClickListeners.goToSignInScreen();
      case AuthEnum.forgetPassword:
        return AppClickListeners.goToSignInScreen();
      case AuthEnum.verifyOtp:
        return AppClickListeners.goToForgetPasswordScreen();
      case AuthEnum.resetPassword:
        return AppClickListeners.goToVerifyOtpScreen();
    }
  }
}
