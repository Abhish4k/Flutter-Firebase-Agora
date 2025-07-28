import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_agora_video_call/utils/app_const_size.dart';
import 'package:flutter_agora_video_call/utils/app_text_style.dart';
import 'package:get/get.dart';
import '../../helper/data_helper.dart';
import '../../utils/app_color.dart';
import '../../utils/app_text_sizes.dart';

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  final RxInt index;
  double height, width;
  List<FocusNode> focusNode;
  int otpLength;

  OtpInput({
    required this.controller,
    required this.autoFocus,
    required this.index,
    this.height = AppConstSize.size60,
    required this.focusNode,
    this.width = AppConstSize.size60,
    required this.otpLength,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstSize.size10),
        border: Border.all(color: AppColor.grey, width: AppConstSize.size1),
      ),
      alignment: Alignment.center,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        controller: controller,
        maxLength: 1,
        focusNode: focusNode[index.value],
        cursorColor: AppColor.themeColor,
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
        style: appTextStyle(
          colour: AppColor.grey,
          height: 1.5,
          fontSize: AppTextSize.smallTextSize(context: context),
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          counterText: '',
          hintStyle: appTextStyle(
            colour: AppColor.grey,
            fontSize: AppTextSize.smallTextSize(context: context),
          ),
          contentPadding: const EdgeInsets.only(top: AppConstSize.size8),
        ),
        canRequestFocus: true,
        onChanged: (value) {
          DataHelper.logValue("otpLength", value.length);
          if (index < otpLength) {
            if (value.isEmpty) {
              if ((index.value) > 0) {
                focusNode[index.value - 1].requestFocus();
              } else {
                FocusScope.of(context).unfocus();
              }
            } else {
              if ((index.value) == (otpLength - 1)) {
                FocusScope.of(context).unfocus();
              } else {
                focusNode[index.value + 1].requestFocus();
              }
            }
          }
        },
      ),
    );
  }
}
