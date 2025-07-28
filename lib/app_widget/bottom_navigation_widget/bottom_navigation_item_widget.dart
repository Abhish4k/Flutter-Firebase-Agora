import 'package:flutter/material.dart';
import 'package:flutter_agora_video_call/app_models/bottom_navigation_model/bottom_navigation_model.dart';
import 'package:flutter_agora_video_call/app_widget/text_widget/text_widget.dart';
import 'package:flutter_agora_video_call/utils/app_color.dart';
import 'package:flutter_agora_video_call/utils/app_const_size.dart';
import 'package:flutter_agora_video_call/utils/image_assets.dart';
import 'package:get/get.dart';

class BottomNavigationItemWidget extends StatelessWidget {
  BuildContext context;
  BottomNavigationModel bottomNavigationModel;
  RxBool isSelected;

  BottomNavigationItemWidget({
    super.key,
    required this.bottomNavigationModel,
    required this.isSelected,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: AppConstSize.size35,
            height: AppConstSize.size35,
            alignment: Alignment.center,
            child: bottomNavigationModel.isSvg
                ? svgAsset(
                    image: isSelected.value
                        ? bottomNavigationModel.selectedImage
                        : bottomNavigationModel.unselectedImage,
                    width: AppConstSize.size22,
                    height: AppConstSize.size22,
                    boxFit: BoxFit.fill,
                  )
                // : dashboardController.profileList.isNotEmpty &&
                //       AppStorageHelper.getUserImage.isNotEmpty &&
                //       AuthMixin.getIsGuest.value == false
                // ?
                //  ?   ClipRRect(
                //         borderRadius: BorderRadius.circular(AppConstSize.size50),
                //         child: AppNetworkImage(
                //           errorImage: ProfileMixin.getProfileValue.value,
                //           imageUrl: AppStorageHelper.getUserImage,
                //           width: AppConstSize.size25,
                //           height: AppConstSize.size25,
                //           boxFit: BoxFit.fill,
                //         ),
                //       )
                : imageAsset(
                    image: isSelected.value
                        ? bottomNavigationModel.selectedImage
                        : bottomNavigationModel.unselectedImage,
                    width: AppConstSize.size30,
                    height: AppConstSize.size30,
                    color: isSelected.value
                        ? AppColor.dotColor
                        : AppColor.dotColor.withValues(alpha: 0.8),
                    boxFit: BoxFit.fill,
                  ),
          ),
          Flexible(
            child: textWidget(
              text: bottomNavigationModel.title,
              height: AppConstSize.size0,
              colour: isSelected.value
                  ? AppColor.dotColor
                  : AppColor.dotColor.withValues(alpha: 0.8),
            ),
          ),
        ],
      ),
    );
  }
}
