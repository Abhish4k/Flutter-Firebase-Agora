import 'package:flutter/material.dart';
import 'package:flutter_agora_video_call/app_enums/dashboard_enum/quick_actions_enum.dart';
import 'package:flutter_agora_video_call/app_mixins/dashboard_mixin/home_mixin.dart';
import 'package:flutter_agora_video_call/app_widget/text_widget/text_widget.dart';
import 'package:flutter_agora_video_call/main.dart';
import 'package:flutter_agora_video_call/utils/app_color.dart';
import 'package:flutter_agora_video_call/utils/app_const_size.dart';
import 'package:flutter_agora_video_call/utils/app_strings.dart';
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
      padding: EdgeInsets.symmetric(vertical: AppConstSize.size10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(left: AppConstSize.size2),
            child: textWidget(
              text: AppStrings.quickActions,
              fontWeight: FontWeight.bold,
              fontSize: AppTextSize.normalTextSize(context: context),
            ),
          ),
          SizedBox(
            height: appHeight(context: context) / 2,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // number of items in each row
                mainAxisSpacing: AppConstSize.size8, // spacing between rows
                crossAxisSpacing: AppConstSize.size8, // spacing between columns
              ),
              itemCount: dashboardController.fetchHomeQuickActionsList().length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () =>
                      dashboardController.homeQuickActionsList[index].onTap(),

                  child: Container(
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        textWidget(
                          text: dashboardController
                              .homeQuickActionsList[index]
                              .quickActionEmoji,
                          colour: AppColor.white,
                          fontSize: AppTextSize.largeSize(context: context),
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: AppConstSize.size5),
                        textWidget(
                          text: dashboardController
                              .homeQuickActionsList[index]
                              .quickActionTitle,
                          colour: AppColor.white,
                          fontSize: AppTextSize.normalTextSize(
                            context: context,
                          ),
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  QuickActionsEnum _quickActionsTap({required int index}) {
    switch (index) {
      case 0:
        return QuickActionsEnum.askAI;
      case 1:
        return QuickActionsEnum.startCall;
      case 2:
        return QuickActionsEnum.myConnections;
      case 3:
        return QuickActionsEnum.tasks;
      default:
        throw Exception("Invalid index");
    }
  }
}
