import 'package:flutter/material.dart';
import 'package:flutter_agora_video_call/app_widget/text_widget/text_widget.dart';
import 'package:flutter_agora_video_call/main.dart';
import 'package:flutter_agora_video_call/utils/app_color.dart';
import 'package:flutter_agora_video_call/utils/app_const_size.dart';
import 'package:flutter_agora_video_call/utils/app_images.dart';
import 'package:flutter_agora_video_call/utils/app_strings.dart';
import 'package:flutter_agora_video_call/utils/app_text_sizes.dart';
import 'package:flutter_agora_video_call/utils/image_assets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        _quickActionsWidget(context: context),
        _upcomingMeetingsWidget(context: context),
      ],
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
              colour: AppColor.darkTealBlue,
              fontSize: AppTextSize.normalTextSize(context: context),
            ),
          ),
          SizedBox(
            height: appHeight(context: context) * 0.42,
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
                        imageAsset(
                          image: dashboardController
                              .homeQuickActionsList[index]
                              .quickActionImage,
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

  _upcomingMeetingsWidget({required BuildContext context}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin: EdgeInsets.only(left: AppConstSize.size2),
              child: textWidget(
                text: AppStrings.upcomingMeetings,
                fontWeight: FontWeight.bold,
                colour: AppColor.darkTealBlue,
                fontSize: AppTextSize.normalTextSize(context: context),
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {},
              child: textWidget(
                text: "View all",
                fontWeight: FontWeight.w400,
                colour: AppColor.darkTealBlue,
                fontSize: AppTextSize.idealTextSize(context: context),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 180, // Provide a bounded height
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(AppConstSize.size10),
                margin: EdgeInsets.all(AppConstSize.size10),
                decoration: BoxDecoration(
                  boxShadow: kElevationToShadow[1],
                  color: AppColor.darkTealBlue,
                  borderRadius: BorderRadius.circular(AppConstSize.size10),
                  border: Border.all(color: AppColor.darkTealBlue),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          padding: EdgeInsets.all(AppConstSize.size5),
                          decoration: BoxDecoration(
                            gradient: AppColor.greyGradiant,
                            borderRadius: BorderRadius.circular(
                              AppConstSize.size25,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              AppConstSize.size25,
                            ),
                            child: imageAsset(
                              image: AppImages.profileSelectedIcon,
                              height: AppConstSize.size25,
                              width: AppConstSize.size25,
                            ),
                          ),
                        ),
                        SizedBox(width: AppConstSize.size10),
                        textWidget(
                          text: "Meeting Name",
                          colour: AppColor.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    SizedBox(height: AppConstSize.size5),
                    SizedBox(
                      width: 150, // Give it a specific width
                      height: 1,
                      child: Container(color: AppColor.textColor),
                    ),
                    SizedBox(height: AppConstSize.size5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            textWidget(
                              text: "Date :",
                              fontWeight: FontWeight.w400,
                              colour: AppColor.lightTextColor,
                            ),
                            SizedBox(width: AppConstSize.size10),
                            textWidget(
                              text: "08-08-2025",
                              colour: AppColor.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        SizedBox(width: AppConstSize.size10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            textWidget(
                              text: "Time :",
                              fontWeight: FontWeight.w400,
                              colour: AppColor.lightTextColor,
                            ),
                            SizedBox(width: AppConstSize.size10),
                            textWidget(
                              text: "12:15 PM",
                              colour: AppColor.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: AppConstSize.size10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 70,
                          height: AppConstSize.size35,
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(
                              AppConstSize.size8,
                            ),
                          ),
                          child: Center(
                            child: textWidget(
                              text: "Start",
                              colour: AppColor.greenColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: AppConstSize.size10),
                        Container(
                          width: 70,
                          height: AppConstSize.size35,
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(
                              AppConstSize.size8,
                            ),
                          ),
                          child: Center(
                            child: textWidget(
                              text: "Cancel",
                              colour: AppColor.redColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
