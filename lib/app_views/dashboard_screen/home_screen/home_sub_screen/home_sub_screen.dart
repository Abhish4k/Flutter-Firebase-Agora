import 'package:flutter/material.dart';
import 'package:flutter_agora_video_call/app_widget/quick_actions_app_bar_widget/quick_action_app_bar_widget.dart';
import 'package:flutter_agora_video_call/utils/app_status_bar.dart';

class HomeSubScreen extends StatelessWidget {
  const HomeSubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithThemeStatusBar,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [HomeSubAppBarWidget()],
      ),
    );
  }
}
