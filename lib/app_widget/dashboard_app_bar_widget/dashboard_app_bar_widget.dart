import 'package:flutter/material.dart';
import 'package:flutter_agora_video_call/app_widget/text_widget/text_widget.dart';
import 'package:flutter_agora_video_call/main.dart';
import 'package:flutter_agora_video_call/utils/app_color.dart';
import 'package:flutter_agora_video_call/utils/app_const_size.dart';
import 'package:flutter_agora_video_call/utils/app_images.dart';
import 'package:flutter_agora_video_call/utils/app_strings.dart';
import 'package:flutter_agora_video_call/utils/app_text_sizes.dart';
import 'package:flutter_agora_video_call/utils/dashboard_screen_indexes.dart';
import 'package:flutter_agora_video_call/utils/image_assets.dart';

class DashBoardAppBarWidget extends StatelessWidget {
  int currentIndex;
  DashBoardAppBarWidget({super.key, required this.currentIndex});

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
          currentIndex == HOME_INDEX
              ? SizedBox()
              : GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () =>
                      dashboardController.screenIndex.value = HOME_INDEX,
                  child: imageAsset(
                    image: AppImages.backImg,
                    height: AppConstSize.size20,
                    width: AppConstSize.size30,
                    color: AppColor.white,
                  ),
                ),
          textWidget(
            text: getDashboardAppBarTitle(),
            fontSize: AppTextSize.normalTextSize(context: context),
            fontWeight: FontWeight.bold,
            colour: AppColor.white,
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: getDashboardAppBarIconTap(),
            child: imageAsset(
              image: currentIndex == HOME_INDEX
                  ? AppImages.notificationImg
                  : currentIndex == CONNECTIONS_INDEX
                  ? AppImages.chatImg
                  : AppImages.editImg,
              color: AppColor.white,
              height: AppConstSize.size25,
              width: AppConstSize.size25,
            ),
          ),
        ],
      ),
    );
  }

  getDashboardAppBarTitle() {
    String dashBoardAppBarTitle;
    switch (currentIndex) {
      case HOME_INDEX:
        dashBoardAppBarTitle = AppStrings.home;
        break;
      case CONNECTIONS_INDEX:
        dashBoardAppBarTitle = AppStrings.connections;
        break;
      case PROFILE_INDEX:
        dashBoardAppBarTitle = AppStrings.profile;
        break;
      default:
        dashBoardAppBarTitle = AppStrings.home;
    }
    return dashBoardAppBarTitle;
  }

  Function() getDashboardAppBarIconTap() {
    switch (currentIndex) {
      case HOME_INDEX:
        return () {
          print('Notification tapped on home screen');
          // Add notification logic here
        };
      case CONNECTIONS_INDEX:
        return () {
          print('Chat tapped on connections screen');
          // Add chat logic here
        };
      case PROFILE_INDEX:
        return () {
          print('Edit tapped on profile screen');
          // Add edit profile logic here
        };
      default:
        return () {
          print('Default action tapped');
          // Add default logic here
        };
    }
  }
}
