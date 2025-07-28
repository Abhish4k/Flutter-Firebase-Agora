import 'package:flutter/material.dart';

class OtpModel {
  TextEditingController textEditingController;
  bool autoFocus;
  FocusNode focusNode;

  OtpModel({
    required this.textEditingController,
    required this.autoFocus,
    required this.focusNode,
  });
}
