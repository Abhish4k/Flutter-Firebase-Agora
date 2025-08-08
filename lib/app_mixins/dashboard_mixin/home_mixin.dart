import 'package:flutter_agora_video_call/app_enums/dashboard_enum/quick_actions_enum.dart';
import 'package:get/get.dart';

mixin HomeMixin {
  static Rx<QuickActionsEnum> quickActionSelectedValue =
      QuickActionsEnum.askAI.obs;
  static Rx<QuickActionsEnum> get getQuickActionSelectedValue =>
      quickActionSelectedValue;
  static set setQuickActionSelectedValue(QuickActionsEnum qEnum) {
    quickActionSelectedValue.value = qEnum;
  }
}
