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

class QuickActionsAppBarWidget extends StatelessWidget {
  QuickActionsAppBarWidget({super.key});

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
            text: getQuickActionsAppBarTitle(
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

  String getQuickActionsAppBarTitle({required QuickActionsEnum qAEnum}) {
    switch (qAEnum) {
      case QuickActionsEnum.askAI:
        return AppStrings.homeQuickActionsTitle1;
      case QuickActionsEnum.startCall:
        return AppStrings.homeQuickActionsTitle2;
      case QuickActionsEnum.myConnections:
        return AppStrings.homeQuickActionsTitle3;
      case QuickActionsEnum.tasks:
        return AppStrings.homeQuickActionsTitle4;
    }
  }
}
