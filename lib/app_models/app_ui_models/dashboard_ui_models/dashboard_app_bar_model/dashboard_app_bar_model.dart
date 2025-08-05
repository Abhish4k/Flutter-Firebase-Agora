import 'package:flutter/material.dart';
import 'package:flutter_agora_video_call/app_enums/app_bar_action_enum/app_bar_action_enum.dart';
import 'package:flutter_agora_video_call/main.dart';
import 'package:flutter_agora_video_call/utils/app_images.dart';
import 'package:flutter_agora_video_call/utils/app_strings.dart';
import 'package:flutter_agora_video_call/utils/dashboard_screen_indexes.dart';

class DashboardAppBarModel {
  final String title;
  final String icon;
  final AppBarAction iconAction;
  final bool showBackButton;
  final AppBarAction? backAction;

  const DashboardAppBarModel({
    required this.title,
    required this.icon,
    required this.iconAction,
    this.showBackButton = false,
    this.backAction,
  });

  VoidCallback? get onIconTap => iconAction.action;
  VoidCallback? get onBackTap =>
      backAction?.action ??
      (() {
        dashboardController.screenIndex.value = HOME_INDEX;
      });
}

class DashboardAppBarConfig {
  static DashboardAppBarModel getAppBarConfig(int currentIndex) {
    switch (currentIndex) {
      case HOME_INDEX:
        return DashboardAppBarModel(
          title: AppStrings.home,
          icon: AppImages.notificationImg,
          iconAction: const AppBarAction(type: AppBarActionType.notification),
          showBackButton: false,
        );
      case CONNECTIONS_INDEX:
        return DashboardAppBarModel(
          title: AppStrings.connections,
          icon: AppImages.chatImg,
          iconAction: const AppBarAction(type: AppBarActionType.chat),
          showBackButton: true,
          backAction: const AppBarAction(type: AppBarActionType.back),
        );
      case PROFILE_INDEX:
        return DashboardAppBarModel(
          title: AppStrings.profile,
          icon: AppImages.editImg,
          iconAction: const AppBarAction(type: AppBarActionType.edit),
          showBackButton: true,
          backAction: const AppBarAction(type: AppBarActionType.back),
        );
      default:
        return DashboardAppBarModel(
          title: AppStrings.home,
          icon: AppImages.notificationImg,
          iconAction: const AppBarAction(type: AppBarActionType.notification),
          showBackButton: false,
        );
    }
  }
}
