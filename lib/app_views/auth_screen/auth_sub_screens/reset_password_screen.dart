import 'package:flutter/material.dart';
import 'package:flutter_agora_video_call/app_widget/app_text_field_widget/app_text_field_widget.dart';
import 'package:flutter_agora_video_call/app_widget/text_widget/text_widget.dart';
import 'package:flutter_agora_video_call/utils/app_color.dart';
import 'package:flutter_agora_video_call/utils/app_const_size.dart';
import 'package:flutter_agora_video_call/utils/app_strings.dart';
import 'package:flutter_agora_video_call/utils/app_text_controller.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: AppConstSize.size5),
        textWidget(
          text: AppStrings.resetPasswordAlternateHeading,
          fontSize: AppConstSize.size24,
          fontWeight: FontWeight.bold,
          colour: AppColor.dotColor,
          alignment: TextAlign.center,
        ),
        SizedBox(height: AppConstSize.size5),
        textWidget(
          text: AppStrings.resetPasswordAlternateDesc,
          fontSize: AppConstSize.size12,
          fontWeight: FontWeight.w400,
          alignment: TextAlign.center,
          colour: AppColor.textColor,
        ),
        SizedBox(height: AppConstSize.size50),
        AppTextFieldWidget(
          textEditingController: passwordController,
          title: AppStrings.enterNewPassword,
          hintText: AppStrings.enterNewPassword,
        ),
        AppTextFieldWidget(
          textEditingController: confirmPasswordController,
          title: AppStrings.confirmPassword,
          hintText: AppStrings.confirmNewPassword,
        ),
      ],
    );
  }
}
