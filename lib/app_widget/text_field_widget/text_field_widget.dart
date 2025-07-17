import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_agora_video_call/app_widget/app_circular_bar_widget/app_circular_bar.dart';
import 'package:flutter_agora_video_call/utils/app_color.dart';
import 'package:flutter_agora_video_call/utils/app_const_size.dart';
import 'package:flutter_agora_video_call/utils/app_images.dart';
import 'package:flutter_agora_video_call/utils/app_text_sizes.dart';
import 'package:flutter_agora_video_call/utils/app_text_style.dart';
import 'package:flutter_agora_video_call/helper/data_helper.dart';
import 'package:flutter_agora_video_call/utils/image_assets.dart';
import 'package:get/get.dart';

class TextFieldWidget extends StatelessWidget {
  final String hint, image;
  final TextEditingController textFieldController;
  final TextInputType? keyboardType;
  final int? maxLength;
  final double? hintTextSize;
  final bool enableEdit;
  final bool isLabelText;
  final RxBool? isPass;
  final Color backgroundColor, textColor, eyeColor, hintColor;
  final bool isLoader;
  final FontWeight fontWeight;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? textFormatter;
  final bool isMax, isSearch;
  final double pLeft, pRight, borderRadius, pHorizontal, pVert, imageSize;
  final dynamic height;
  final Function(String)? searchValue;

  const TextFieldWidget({
    super.key,
    this.pLeft = AppConstSize.size0,
    this.pRight = AppConstSize.size0,
    this.keyboardType,
    this.height = AppConstSize.size55,
    this.maxLength,
    this.isPass,
    this.isLabelText = false,
    this.image = "",
    required this.textFieldController,
    required this.hint,
    this.enableEdit = true,
    this.textFormatter,
    this.isLoader = false,
    this.isSearch = false,
    this.borderRadius = AppConstSize.size0,
    this.focusNode,
    this.pHorizontal = AppConstSize.size0,
    this.pVert = AppConstSize.size12,
    this.searchValue,
    this.eyeColor = AppColor.black,
    this.hintColor = AppColor.lightTextColor,
    this.backgroundColor = AppColor.transparent,
    this.textColor = AppColor.black,
    this.fontWeight = FontWeight.normal,
    this.isMax = false,
    this.imageSize = AppConstSize.size20,
    this.hintTextSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: appWidth(context: context),
      padding: EdgeInsets.only(
        left: pLeft,
        right: pRight,
        top: AppConstSize.size0,
        bottom: AppConstSize.size0,
      ),
      child: isLoader
          ? Align(
              alignment: Alignment.centerLeft,
              child:
                  SizedBox(
                    height: AppConstSize.size14,
                    width: AppConstSize.size14,
                    child: AppCircularBar(),
                  ).marginOnly(
                    left: AppConstSize.size15,
                    right: AppConstSize.size0,
                    top: AppConstSize.size0,
                    bottom: AppConstSize.size0,
                  ),
            )
          : isMax
          ? Container(
              height: height,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(borderRadius + 1),
                ),

                // borderRadiusAllExtension(all: borderRadius + 1),
              ),
              child: MediaQuery(
                data: MediaQueryData(textScaler: TextScaler.noScaling),
                child: TextField(
                  enabled: enableEdit,
                  autofocus: false,
                  focusNode: focusNode,
                  controller: textFieldController,
                  keyboardType: keyboardType,
                  maxLines: null,
                  maxLength: maxLength,
                  inputFormatters: textFormatter,
                  style: appTextStyle(
                    height: 1.5,
                    colour: textColor,
                    fontWeight: fontWeight,
                    fontSize: hintTextSize != null
                        ? hintTextSize!
                        : isLabelText
                        ? AppTextSize.idealTextSize(context: context)
                        : AppTextSize.normalTextSize(context: context),
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hint,
                    isDense: true,
                    hintStyle: appTextStyle(
                      height: 1.5,
                      colour: AppColor.grey.withAlpha((.5 * 255).round()),
                      fontSize:
                          hintTextSize ??
                          AppTextSize.idealTextSize(context: context),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: pHorizontal,
                      vertical: pVert,
                    ),
                  ),
                  onChanged: isSearch
                      ? searchValue
                      : (value) {
                          DataHelper.logValue(
                            "onChanged",
                            textFieldController.text.toString(),
                          );
                        },
                ),
              ),
            )
          : isPass == null
          ? Container(
              height: height,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(borderRadius + 1),
                ),
              ),
              child: MediaQuery(
                data: MediaQueryData(textScaler: TextScaler.noScaling),
                child: TextField(
                  enabled: enableEdit,
                  autofocus: false,
                  controller: textFieldController,
                  keyboardType: keyboardType,
                  maxLength: maxLength,
                  focusNode: focusNode,
                  inputFormatters: textFormatter,
                  style: appTextStyle(
                    height: 1.5,
                    colour: textColor,
                    fontWeight: fontWeight,
                    fontSize: hintTextSize != null
                        ? hintTextSize!
                        : isLabelText
                        ? AppTextSize.idealTextSize(context: context)
                        : AppTextSize.normalTextSize(context: context),
                  ),
                  decoration: InputDecoration(
                    isDense: false,
                    border: InputBorder.none,
                    hintText: hint,
                    hintStyle: appTextStyle(
                      height: 1.5,
                      colour: isLabelText
                          ? AppColor.dotColor
                          : AppColor.grey.withAlpha((.5 * 255).round()),
                      fontSize:
                          hintTextSize ??
                          AppTextSize.idealTextSize(context: context),
                      fontWeight: fontWeight,
                    ),
                    prefixIconConstraints: BoxConstraints(
                      minWidth: image.isNotEmpty
                          ? AppConstSize.size35
                          : AppConstSize.size0,
                      minHeight: image.isNotEmpty
                          ? AppConstSize.size35
                          : AppConstSize.size0,
                    ),
                    prefixIcon: image.isNotEmpty
                        ? _prefixIcon()
                        : const SizedBox(width: AppConstSize.size0),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: pHorizontal,
                      vertical: pVert,
                    ),
                  ),
                  onChanged: isSearch
                      ? searchValue
                      : (value) {
                          DataHelper.logValue("isSearch", value);
                        },
                ),
              ),
            )
          : Obx(
              () => Container(
                height: height,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius:
                      //borderRadiusALLExtension
                      BorderRadius.all(Radius.circular(borderRadius + 1)),
                ),
                child: IntrinsicWidth(
                  child: MediaQuery(
                    data: MediaQueryData(textScaler: TextScaler.noScaling),
                    child: TextField(
                      enabled: enableEdit,
                      textAlignVertical: TextAlignVertical.center,
                      autofocus: false,
                      controller: textFieldController,
                      focusNode: focusNode,
                      obscureText: isPass!.value,
                      maxLines: 1,
                      keyboardType: keyboardType,
                      maxLength: maxLength,
                      style: appTextStyle(
                        height: 1.5,
                        colour: textColor,
                        fontWeight: fontWeight,
                        fontSize: hintTextSize != null
                            ? hintTextSize!
                            : isLabelText
                            ? AppTextSize.idealTextSize(context: context)
                            : AppTextSize.normalTextSize(context: context),
                      ),
                      inputFormatters: textFormatter,
                      decoration: InputDecoration(
                        isDense: true,
                        border: InputBorder.none,
                        prefixIconConstraints: BoxConstraints(
                          minWidth: image.isNotEmpty
                              ? AppConstSize.size35
                              : AppConstSize.size0,
                          minHeight: image.isNotEmpty
                              ? AppConstSize.size35
                              : AppConstSize.size0,
                        ),
                        prefixIcon: image.isNotEmpty
                            ? _prefixIcon()
                            : const SizedBox(width: AppConstSize.size0),
                        suffixIconConstraints: BoxConstraints(
                          minWidth: AppConstSize.size5,
                          minHeight: AppConstSize.size5,
                        ),
                        suffixIcon: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () => isPass!.value = !isPass!.value,

                          ///---- un- comment code, if show the eye in password text field --///
                          child: imageAsset(
                            image: isPass!.value
                                ? AppImages.closeEyeImg
                                : AppImages.openEyeImg,
                            width: AppConstSize.size20,
                            height: AppConstSize.size20,
                            color: eyeColor,
                          ),
                        ),
                        hintText: hint,
                        hintStyle: appTextStyle(
                          height: 1.5,
                          colour: isLabelText
                              ? AppColor.dotColor
                              : AppColor.grey.withAlpha((.5 * 255).round()),
                          fontSize:
                              hintTextSize ??
                              AppTextSize.idealTextSize(context: context),

                          fontWeight: fontWeight,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: pHorizontal,
                          vertical: pVert,
                        ),
                      ),
                      onChanged: (value) {
                        DataHelper.logValue(
                          "onChanged",
                          textFieldController.text.toString().toString(),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  Widget _prefixIcon() => Padding(
    padding: EdgeInsets.symmetric(
      horizontal: AppConstSize.size0,
      vertical: AppConstSize.size10,
    ),
    child: imageAsset(image: image, width: imageSize, height: imageSize),
  );
}
