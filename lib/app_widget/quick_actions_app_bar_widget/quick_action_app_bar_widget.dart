import 'package:flutter/material.dart';
import 'package:flutter_agora_video_call/app_click_listeners/app_click_listeners.dart';
import 'package:flutter_agora_video_call/app_enums/dashboard_enum/quick_actions_enum.dart';
import 'package:flutter_agora_video_call/app_mixins/dashboard_mixin/home_mixin.dart';
import 'package:flutter_agora_video_call/app_widget/text_widget/text_widget.dart';
import 'package:flutter_agora_video_call/utils/app_color.dart';
import 'package:flutter_agora_video_call/utils/app_const_size.dart';
import 'package:flutter_agora_video_call/utils/app_images.dart';
import 'package:flutter_agora_video_call/utils/app_strings.dart';
import 'package:flutter_agora_video_call/utils/app_text_sizes.dart';
import 'package:flutter_agora_video_call/utils/image_assets.dart';

class HomeSubAppBarWidget extends StatelessWidget {
  HomeSubAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstSize.size15,
        vertical: AppConstSize.size15,
      ),
      width: appWidth(context: context),
      decoration: BoxDecoration(color: AppColor.dotColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => AppClickListeners.goToDashboardScreen(),
            child: imageAsset(
              image: AppImages.backImg,
              height: AppConstSize.size20,
              width: AppConstSize.size30,
              color: AppColor.white,
            ),
          ),
          textWidget(
            text: getHomeSubAppBarTitle(
              qAEnum: HomeMixin.getQuickActionSelectedValue.value,
            ),
            fontSize: AppTextSize.normalTextSize(context: context),
            fontWeight: FontWeight.bold,
            colour: AppColor.white,
          ),
          SizedBox(),
        ],
      ),
    );
  }

  String getHomeSubAppBarTitle({required HomeSubEnum qAEnum}) {
    switch (qAEnum) {
      case HomeSubEnum.askAI:
        return AppStrings.homeQuickActionsTitle1;
      case HomeSubEnum.startCall:
        return AppStrings.homeQuickActionsTitle2;
      case HomeSubEnum.myConnections:
        return AppStrings.homeQuickActionsTitle3;
      case HomeSubEnum.tasks:
        return AppStrings.homeQuickActionsTitle4;
      case HomeSubEnum.upcommingMeetings:
        return AppStrings.upcomingMeetings;
    }
  }
}
