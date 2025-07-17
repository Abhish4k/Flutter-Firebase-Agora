import 'package:flutter/material.dart';
import 'package:flutter_agora_video_call/app_widget/text_field_widget/text_field_widget.dart';
import 'package:flutter_agora_video_call/app_widget/text_widget/text_widget.dart';
import 'package:flutter_agora_video_call/utils/app_color.dart';
import 'package:flutter_agora_video_call/utils/app_const_size.dart';
import 'package:flutter_agora_video_call/utils/app_strings.dart';
import 'package:flutter_agora_video_call/utils/app_text_controller.dart';
import 'package:flutter_agora_video_call/utils/app_text_sizes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _signUpWidget(context: context);
  }

  _signUpWidget({required BuildContext context}) {
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
                text: AppStrings.getStarted,
                fontSize: AppConstSize.size24,
                fontWeight: FontWeight.bold,
                colour: AppColor.dotColor,
              ),
              textWidget(
                text: AppStrings.registerWithVcConnekt,
                fontSize: AppConstSize.size12,
                fontWeight: FontWeight.w400,
                colour: AppColor.textColor,
              ),
              SizedBox(height: AppConstSize.size50),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  textWidget(
                    text: AppStrings.enterYourEmail,
                    fontSize: AppConstSize.size14,
                    fontWeight: FontWeight.w400,
                    colour: AppColor.dotColor,
                  ),
                  Container(
                    height: AppConstSize.size55,
                    width: appWidth(context: context),
                    padding: EdgeInsets.symmetric(
                      horizontal: AppConstSize.size10,
                    ),
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

                  textWidget(
                    text: AppStrings.enterYourPassword,
                    fontSize: AppConstSize.size14,
                    fontWeight: FontWeight.w400,
                    colour: AppColor.dotColor,
                  ),
                  Container(
                    height: AppConstSize.size55,
                    width: appWidth(context: context),
                    padding: EdgeInsets.symmetric(
                      horizontal: AppConstSize.size10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.themeColor),
                      borderRadius: BorderRadius.circular(AppConstSize.size15),
                    ),
                    child: TextFieldWidget(
                      textFieldController: passwordController,
                      hint: AppStrings.password,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
