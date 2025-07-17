import 'package:flutter/material.dart';
import 'package:flutter_agora_video_call/app_widget/gradient_text_widget/gradient_text_widget.dart';
import 'package:flutter_agora_video_call/app_widget/text_widget/text_widget.dart';
import 'package:flutter_agora_video_call/utils/app_color.dart';
import 'package:flutter_agora_video_call/utils/app_const_size.dart';
import 'package:flutter_agora_video_call/utils/app_text_style.dart';
import 'package:flutter_agora_video_call/utils/image_assets.dart';

class AppButton extends StatelessWidget {
  final double width,
      height,
      borderRadius,
      fontSize,
      imageSize,
      pHorizontal,
      iconLeftMargin;
  final Color textColor, buttonBackgroundColor, borderColor;
  final String text, image;
  final Function() onTap;
  final FontWeight fontWeight;
  final bool isElevation, isSvg, textGradiant, isBorder;

  const AppButton({
    super.key,
    this.width = AppConstSize.size500,
    this.height = AppConstSize.size60,
    this.borderRadius = AppConstSize.size15,
    this.fontWeight = FontWeight.normal,
    this.textColor = AppColor.white,
    required this.text,
    this.image = "",
    this.imageSize = AppConstSize.size15,
    this.pHorizontal = AppConstSize.size0,
    required this.onTap,
    this.isElevation = false,
    this.isSvg = false,
    this.textGradiant = false,
    this.isBorder = false,
    this.fontSize = AppConstSize.size14,
    this.iconLeftMargin = AppConstSize.size0,
    this.borderColor = AppColor.white,
    this.buttonBackgroundColor = AppColor.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: width == AppConstSize.size0 ? null : width,
        height: height,
        padding: EdgeInsets.symmetric(horizontal: pHorizontal),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isBorder
              ? null
              : buttonBackgroundColor == AppColor.transparent
              ? null
              : buttonBackgroundColor,
          gradient: isBorder
              ? null
              : buttonBackgroundColor == AppColor.transparent
              ? AppColor.primaryGradient
              : null,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: isElevation
              ? kElevationToShadow[1]
              : kElevationToShadow[0],
          border: isBorder
              ? Border.all(color: borderColor, width: AppConstSize.size1)
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            image == ""
                ? const SizedBox()
                : Container(
                    margin: EdgeInsets.only(left: iconLeftMargin),
                    child: isSvg
                        ? svgAsset(
                            image: image,
                            width: imageSize,
                            height: imageSize,
                          )
                        : imageAsset(
                            image: image,
                            width: imageSize,
                            height: imageSize,
                          ),
                  ),
            image == "" || text.isEmpty
                ? const SizedBox()
                : const SizedBox(width: AppConstSize.size8),
            text.isNotEmpty
                ? textGradiant
                      ? GradientTextWidget(
                          text,
                          gradient: AppColor.primaryGradient,
                          style: appTextStyle(
                            fontSize: fontSize,
                            fontWeight: fontWeight,
                          ),
                        )
                      : textWidget(
                          text: text,
                          colour: textColor,
                          fontSize: fontSize,
                          fontWeight: fontWeight,
                        )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
