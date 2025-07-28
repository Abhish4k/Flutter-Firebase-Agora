import 'package:flutter/material.dart';
import 'package:flutter_agora_video_call/app_widget/app_text_field_widget/app_text_field_widget.dart';
import 'package:flutter_agora_video_call/app_widget/text_widget/text_widget.dart';
import 'package:flutter_agora_video_call/utils/app_color.dart';
import 'package:flutter_agora_video_call/utils/app_const_size.dart';
import 'package:flutter_agora_video_call/utils/app_strings.dart';
import 'package:flutter_agora_video_call/utils/app_text_controller.dart';

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
                text: AppStrings.signUpAlternateHeading,
                fontSize: AppConstSize.size24,
                fontWeight: FontWeight.bold,
                colour: AppColor.dotColor,
              ),
              textWidget(
                text: AppStrings.signUpAlternateDesc,
                fontSize: AppConstSize.size12,
                fontWeight: FontWeight.w400,
                colour: AppColor.textColor,
              ),
              SizedBox(height: AppConstSize.size50),

              AppTextFieldWidget(
                textEditingController: firstNameController,
                title: AppStrings.enterYourFirstName,
                hintText: AppStrings.firstName,
              ),

              AppTextFieldWidget(
                textEditingController: lastNameController,
                title: AppStrings.enterYourLastName,
                hintText: AppStrings.lastName,
              ),
              AppTextFieldWidget(
                textEditingController: emailController,
                title: AppStrings.enterYourEmail,
                hintText: AppStrings.email,
              ),
              AppTextFieldWidget(
                textEditingController: phoneController,
                title: AppStrings.enterYourPhoneNumber,
                hintText: AppStrings.phoneNumber,
              ),
              AppTextFieldWidget(
                textEditingController: dobController,
                title: AppStrings.enterYourDOB,
                hintText: AppStrings.phoneNumber,
              ),
              AppTextFieldWidget(
                textEditingController: passwordController,
                title: AppStrings.enterYourPassword,
                hintText: AppStrings.password,
              ),
              AppTextFieldWidget(
                textEditingController: confirmPasswordController,
                title: AppStrings.confirmPassword,
                hintText: AppStrings.confirmPassword,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
