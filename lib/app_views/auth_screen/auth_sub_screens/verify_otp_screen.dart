import 'package:flutter/material.dart';
import 'package:flutter_agora_video_call/app_widget/otp_input_widget/otp_input_widget.dart';
import 'package:flutter_agora_video_call/app_widget/text_widget/text_widget.dart';
import 'package:flutter_agora_video_call/main.dart';
import 'package:flutter_agora_video_call/utils/app_color.dart';
import 'package:flutter_agora_video_call/utils/app_const_size.dart';
import 'package:flutter_agora_video_call/utils/app_strings.dart';
import 'package:flutter_agora_video_call/utils/app_text_sizes.dart';
import 'package:get/state_manager.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(height: AppConstSize.size5),
        textWidget(
          text: AppStrings.verifyOtpAlternateHeading,
          fontSize: AppConstSize.size24,
          fontWeight: FontWeight.bold,
          colour: AppColor.dotColor,
        ),
        SizedBox(height: AppConstSize.size5),
        textWidget(
          text: AppStrings.verifyOtpAlternateDesc,
          fontSize: AppConstSize.size12,
          fontWeight: FontWeight.w400,
          alignment: TextAlign.center,
          colour: AppColor.textColor,
        ),
        SizedBox(height: AppConstSize.size50),
        _getOtpFields(context: context),
      ],
    );
  }

  // Function that will make all the numbers of Otp fiels as a string like 1 2 3 4 5 6 to 123456
  // String _getOtpController() {
  //   String otp = "";

  //   for (int i = 0; i < dashboardController.getOtpList().length; i++) {
  //     otp += dashboardController
  //         .getOtpList()[i]
  //         .textEditingController
  //         .text
  //         .toString()
  //         .trim();
  //   }

  //   DataHelper.logValue('otpFields', otp);
  //   return otp;
  // }

  // OTP Fields View
  _getOtpFields({required BuildContext context}) => Container(
    width: appWidth(context: context),
    height: AppConstSize.size60,
    alignment: Alignment.center,
    child: ListView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: dashboardController.getOtpList().length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.only(
            right: index < dashboardController.getOtpList().length
                ? AppConstSize.size6
                : 0.0,
          ),
          child: OtpInput(
            otpLength: dashboardController.otpFocusList.length,
            width: AppConstSize.size55,
            height: AppConstSize.size60,
            controller: dashboardController
                .otpControllerList[index]
                .textEditingController,
            autoFocus: dashboardController.otpControllerList[index].autoFocus,
            focusNode: dashboardController.otpFocusList,
            index: index.obs,
          ),
        );
      },
    ),
  );
}
