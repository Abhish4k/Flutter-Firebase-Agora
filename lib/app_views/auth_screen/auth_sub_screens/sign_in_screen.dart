import 'package:flutter/material.dart';
import 'package:flutter_agora_video_call/app_click_listeners/app_click_listeners.dart';
import 'package:flutter_agora_video_call/app_widget/text_field_widget/text_field_widget.dart';
import 'package:flutter_agora_video_call/app_widget/text_widget/text_widget.dart';
import 'package:flutter_agora_video_call/utils/app_color.dart';
import 'package:flutter_agora_video_call/utils/app_const_size.dart';
import 'package:flutter_agora_video_call/utils/app_images.dart';
import 'package:flutter_agora_video_call/utils/app_strings.dart';
import 'package:flutter_agora_video_call/utils/app_text_controller.dart';
import 'package:flutter_agora_video_call/utils/app_text_sizes.dart';
import 'package:flutter_agora_video_call/utils/image_assets.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _signInWidget(context: context);
  }

  _signInWidget({required BuildContext context}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          padding: EdgeInsets.all(AppConstSize.size15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              textWidget(
                text: AppStrings.welcomeBack,
                fontSize: AppConstSize.size24,
                fontWeight: FontWeight.bold,
                colour: AppColor.dotColor,
              ),
              textWidget(
                text: AppStrings.enterYourDetailsBelow,
                fontSize: AppConstSize.size12,
                fontWeight: FontWeight.w400,
                colour: AppColor.textColor,
              ),
              SizedBox(height: AppConstSize.size50),
              Container(
                height: AppConstSize.size55,
                width: appWidth(context: context),
                padding: EdgeInsets.symmetric(horizontal: AppConstSize.size10),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.themeColor),
                  borderRadius: BorderRadius.circular(AppConstSize.size15),
                ),
                child: TextFieldWidget(
                  textFieldController: emailController,
                  hint: AppStrings.email,
                ),
              ),
              SizedBox(height: AppConstSize.size20),
              Container(
                height: AppConstSize.size55,
                width: appWidth(context: context),
                padding: EdgeInsets.symmetric(horizontal: AppConstSize.size10),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.themeColor),
                  borderRadius: BorderRadius.circular(AppConstSize.size15),
                ),
                child: TextFieldWidget(
                  textFieldController: passwordController,
                  hint: AppStrings.password,
                ),
              ),
              SizedBox(height: AppConstSize.size10),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => AppClickListeners.goToForgetPasswordScreen(),
                    child: textWidget(
                      text: AppStrings.forgotPassword,
                      fontWeight: FontWeight.w500,
                      colour: AppColor.dotColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppConstSize.size10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  textWidget(
                    text: AppStrings.orLoginWith,
                    colour: AppColor.textColor,
                    fontSize: AppConstSize.size12,
                  ),
                  SizedBox(height: AppConstSize.size10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      _socialButtonsWidget(
                        svgIcon: AppImages.googleSvg,
                        iconName: AppStrings.google,
                        onTap: () {},
                      ),
                      SizedBox(width: AppConstSize.size10),
                      _socialButtonsWidget(
                        svgIcon: AppImages.facebookSvg,
                        iconName: AppStrings.facebook,
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  _socialButtonsWidget({
    required String svgIcon,
    required String iconName,
    required Function() onTap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: AppConstSize.size15,
              horizontal: AppConstSize.size20,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.lightGrey),
              borderRadius: BorderRadius.circular(AppConstSize.size15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                svgAsset(
                  image: svgIcon,
                  width: AppConstSize.size30,
                  height: AppConstSize.size30,
                ),
                SizedBox(width: AppConstSize.size10),
                textWidget(
                  text: iconName,
                  colour: AppColor.dotColor,
                  fontSize: AppConstSize.size12,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
