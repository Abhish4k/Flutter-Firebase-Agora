import 'package:flutter/material.dart';
import 'package:flutter_agora_video_call/utils/app_color.dart';
import 'package:flutter_agora_video_call/utils/app_text_sizes.dart';

class AppCircularBar extends StatelessWidget {
  final Color? color;
  const AppCircularBar({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: appHeight(context: context),
      width: appWidth(context: context),
      color: color ?? AppColor.black.withValues(alpha: .20),
      child: CircularProgressIndicator(color: AppColor.themeColor),
    );
  }
}
