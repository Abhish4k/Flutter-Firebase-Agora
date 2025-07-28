import 'package:flutter/material.dart';
import 'package:flutter_agora_video_call/app_widget/app_text_field_widget/app_text_field_widget.dart';
import 'package:flutter_agora_video_call/app_widget/text_widget/text_widget.dart';
import 'package:flutter_agora_video_call/utils/app_color.dart';
import 'package:flutter_agora_video_call/utils/app_const_size.dart';
import 'package:flutter_agora_video_call/utils/app_strings.dart';
import 'package:flutter_agora_video_call/utils/app_text_controller.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                text: AppStrings.forgotPasswordAlternateHeading,
                fontSize: AppConstSize.size24,
                fontWeight: FontWeight.bold,
                colour: AppColor.dotColor,
              ),
              SizedBox(height: AppConstSize.size5),
              textWidget(
                text: AppStrings.forgotPasswordAlternateDesc,
                fontSize: AppConstSize.size12,
                fontWeight: FontWeight.w400,
                alignment: TextAlign.center,
                colour: AppColor.textColor,
              ),
              SizedBox(height: AppConstSize.size50),
              AppTextFieldWidget(
                textEditingController: emailController,
                title: AppStrings.enterEmailorPhoneNo,
                hintText: AppStrings.enterEmailorPhoneNo,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
