import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_agora_video_call/app_models/bottom_navigation_model/bottom_navigation_model.dart';
import 'package:flutter_agora_video_call/utils/app_const_size.dart';
import 'package:get/get.dart';
import '../../utils/app_color.dart';
import 'bottom_navigation_item_widget.dart';

class BottomNavigationWidget extends StatelessWidget {
  final List<BottomNavigationModel> itemList;
  final RxInt selectedIndex;
  final double width, height;

  const BottomNavigationWidget({
    super.key,
    this.height = AppConstSize.size40,
    this.width = AppConstSize.size150,
    required this.itemList,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.only(
        bottom: Platform.isIOS ? AppConstSize.size10 : AppConstSize.size0,
      ),
      margin: EdgeInsets.only(
        bottom: Platform.isIOS ? AppConstSize.size35 : AppConstSize.size25,
        left: AppConstSize.size10,
        right: AppConstSize.size10,
      ),
      decoration: BoxDecoration(
        boxShadow: kElevationToShadow[2],
        color: AppColor.white,
        borderRadius: BorderRadius.circular(AppConstSize.size70),
      ),
      child: Container(
        alignment: Alignment.center,
        child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.only(
            top: AppConstSize.size7,
            bottom: AppConstSize.size7,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: itemList.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: itemList[index].onTab,
              child: Container(
                width: Get.width / 4.5,
                alignment: Alignment.center,
                padding: const EdgeInsets.only(right: 0.0),
                child: Obx(
                  () => BottomNavigationItemWidget(
                    context: context,
                    bottomNavigationModel: itemList[index],
                    isSelected: selectedIndex.value == index
                        ? true.obs
                        : false.obs,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
