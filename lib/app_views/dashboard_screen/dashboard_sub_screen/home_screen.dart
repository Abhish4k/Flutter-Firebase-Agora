import 'package:flutter/material.dart';
import 'package:flutter_agora_video_call/app_mixins/dashboard_mixin/dashboard_mixin.dart';
import 'package:flutter_agora_video_call/app_widget/text_widget/text_widget.dart';
import 'package:flutter_agora_video_call/utils/app_color.dart';
import 'package:flutter_agora_video_call/utils/app_const_size.dart';
import 'package:flutter_agora_video_call/utils/app_images.dart';
import 'package:flutter_agora_video_call/utils/image_assets.dart';
import 'package:flutter_agora_video_call/app_models/app_ui_models/greetings_model/greeting_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [_homeUserGreetingWidget()],
    );
  }

  _homeUserGreetingWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          padding: EdgeInsets.all(AppConstSize.size10),
          decoration: BoxDecoration(
            gradient: AppColor.primaryGradient.withOpacity(0.5),
            borderRadius: BorderRadius.circular(AppConstSize.size25),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppConstSize.size25),
            child: imageAsset(
              image: AppImages.profileSelectedIcon,
              height: AppConstSize.size25,
              width: AppConstSize.size25,
            ),
          ),
        ),
        SizedBox(width: AppConstSize.size10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            textWidget(text: "Hey! Abhishek", fontWeight: FontWeight.bold),
            textWidget(
              text: DashboardMixin.greetingText().greeting,
              fontWeight: FontWeight.bold,
            ),
            textWidget(
              text: DashboardMixin.greetingText().message,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ],
    );
  }
}
