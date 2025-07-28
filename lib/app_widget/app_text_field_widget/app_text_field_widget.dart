import 'package:flutter/material.dart';
import 'package:flutter_agora_video_call/app_widget/text_field_widget/text_field_widget.dart';
import 'package:flutter_agora_video_call/app_widget/text_widget/text_widget.dart';
import 'package:flutter_agora_video_call/utils/app_color.dart';
import 'package:flutter_agora_video_call/utils/app_const_size.dart';
import 'package:flutter_agora_video_call/utils/app_text_sizes.dart';

class AppTextFieldWidget extends StatelessWidget {
  TextEditingController textEditingController;
  String title, hintText;

  AppTextFieldWidget({
    super.key,
    required this.textEditingController,
    required this.title,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppConstSize.size12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          textWidget(
            text: title,
            fontSize: AppConstSize.size14,
            fontWeight: FontWeight.w400,
            colour: AppColor.dotColor,
          ),
          Container(
            height: AppConstSize.size55,
            width: appWidth(context: context),
            padding: EdgeInsets.symmetric(horizontal: AppConstSize.size10),
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.themeColor),
              borderRadius: BorderRadius.circular(AppConstSize.size15),
            ),
            child: TextFieldWidget(
              textFieldController: textEditingController,
              hint: hintText,
            ),
          ),
        ],
      ),
    );
  }
}
