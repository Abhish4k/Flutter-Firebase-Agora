import 'package:flutter_agora_video_call/app_enums/dashboard_enum/quick_actions_enum.dart';
import 'package:get/get.dart';

mixin HomeMixin {
  static Rx<HomeSubEnum> quickActionSelectedValue = HomeSubEnum.askAI.obs;
  static Rx<HomeSubEnum> get getQuickActionSelectedValue =>
      quickActionSelectedValue;
  static set setQuickActionSelectedValue(HomeSubEnum qEnum) {
    quickActionSelectedValue.value = qEnum;
  }
}
