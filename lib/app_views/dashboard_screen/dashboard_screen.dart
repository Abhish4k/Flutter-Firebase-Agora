import 'package:flutter/material.dart';
import 'package:flutter_agora_video_call/app_widget/bottom_navigation_widget/bottom_navigation_widget.dart';
import 'package:flutter_agora_video_call/app_widget/dashboard_app_bar_widget/dashboard_app_bar_widget.dart';
import 'package:flutter_agora_video_call/main.dart';
import 'package:flutter_agora_video_call/utils/app_const_size.dart';
import 'package:flutter_agora_video_call/utils/app_status_bar.dart';
import 'package:flutter_agora_video_call/utils/app_text_sizes.dart';
import 'package:get/state_manager.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithThemeStatusBar,
      body: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            DashBoardAppBarWidget(
              currentIndex: dashboardController.screenIndex.value,
            ),

            SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: dashboardController.fetchScreenList().elementAt(
                dashboardController.screenIndex.value,
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationWidget(
        itemList: dashboardController.fetchBottomNavigationBar(),
        selectedIndex: dashboardController.screenIndex,
        height: AppConstSize.size80,
        width: appWidth(context: context),
      ),
    );
  }
}
