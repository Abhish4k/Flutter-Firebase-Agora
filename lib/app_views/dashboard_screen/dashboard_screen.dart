import 'package:flutter/material.dart';
import 'package:flutter_agora_video_call/app_widget/bottom_navigation_widget/bottom_navigation_widget.dart';
import 'package:flutter_agora_video_call/main.dart';
import 'package:flutter_agora_video_call/utils/app_const_size.dart';
import 'package:flutter_agora_video_call/utils/app_text_sizes.dart';
import 'package:get/get.dart';
import 'package:flutter_agora_video_call/app_mixins/dashboard_mixin/dashboard_mixin.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Obx(() {
        final posts = DashboardMixin.getPostsList;
        if (posts.isEmpty) {
          return const Center(child: Text('No posts available'));
        }
        return ListView.builder(
          itemCount: DashboardMixin.getPostsList.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(
                title: Text(DashboardMixin.getPostsList[index].title ?? ''),
                subtitle: Text(DashboardMixin.getPostsList[index].body ?? ''),
              ),
            );
          },
        );
      }),
      bottomNavigationBar: BottomNavigationWidget(
        itemList: dashboardController.fetchBottomNavigationBar(),
        selectedIndex: 0.obs,
        height: AppConstSize.size80,
        width: appWidth(context: context),
      ),
    );
  }
}
