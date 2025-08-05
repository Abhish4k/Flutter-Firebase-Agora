import 'package:flutter/material.dart';
import 'package:flutter_agora_video_call/utils/app_color.dart';
import 'package:flutter_agora_video_call/utils/app_const_size.dart';
import 'package:flutter_agora_video_call/utils/app_text_sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [_quickActionsWidget(context: context)],
    );
  }

  _quickActionsWidget({required BuildContext context}) {
    return Container(
      height: appHeight(context: context) / 2,
      padding: EdgeInsets.symmetric(vertical: AppConstSize.size15),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // number of items in each row
          mainAxisSpacing: AppConstSize.size8, // spacing between rows
          crossAxisSpacing: AppConstSize.size8, // spacing between columns
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(
              vertical: AppConstSize.size20,
              horizontal: AppConstSize.size15,
            ),
            decoration: BoxDecoration(
              gradient: AppColor.primaryGradient,
              border: Border.all(
                color: AppColor.dotColor,
                width: AppConstSize.size1,
              ),
              borderRadius: BorderRadius.circular(AppConstSize.size15),
            ),
          );
        },
      ),
    );
  }
}
