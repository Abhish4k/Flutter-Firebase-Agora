import 'package:flutter_agora_video_call/app_api_service/app_api_service.dart';
import 'package:flutter_agora_video_call/app_models/app_service_model/posts_data_model.dart';
import 'package:flutter_agora_video_call/app_models/app_ui_models/greetings_model/greeting_model.dart';
import 'package:flutter_agora_video_call/helper/data_helper.dart';
import 'package:flutter_agora_video_call/utils/app_color.dart';
import 'package:get/get.dart';

mixin DashboardMixin {
  static RxList<PostsDataModel> postsList = <PostsDataModel>[].obs;

  static RxList<PostsDataModel> get getPostsList => postsList;

  static set setPostsList(List<PostsDataModel> pList) {
    postsList.value = pList;
  }

  static callGetPostsApi() async {
    DataHelper.isLoading.value = true;
    setPostsList = [];
    await AppApiService().callGetPostApi().then((value) {
      DataHelper.isLoading.value = false;
      if (value != null) {
        if (value.data != null) {
          if (value.code == 200 || value.code == 201) {
            if (value.data!.postsList != null) {
              setPostsList = value.data!.postsList!;
            }
          } else {
            DataHelper.showAppToast(
              message: value.message,
              bkgColor: AppColor.dotColor,
            );
          }
        }
      }
    });
  }

  ///------------------- Home Screen Functions --------------------///
  static GreetingModel greetingText() {
    int hour = DateTime.now().hour;

    if (hour >= 0 && hour < 6) {
      return GreetingModel(
        greeting: "Good Night!🌙",
        message: "Hope you're having a peaceful rest",
      );
    } else if (hour >= 6 && hour < 12) {
      return GreetingModel(
        greeting: "Good Morning!☀️",
        message: "Have a wonderful day ahead",
      );
    } else if (hour == 12) {
      return GreetingModel(
        greeting: "Good Noon!🌞",
        message: "Perfect time for a lunch break",
      );
    } else if (hour >= 13 && hour < 17) {
      return GreetingModel(
        greeting: "Good Afternoon!🌤️",
        message: "Hope your day is going great",
      );
    } else if (hour >= 17 && hour < 20) {
      return GreetingModel(
        greeting: "Good Evening!🌅",
        message: "Time to wind down and relax",
      );
    } else if (hour >= 20 && hour <= 23) {
      return GreetingModel(
        greeting: "Good Night!🌙",
        message: "Sweet dreams and rest well",
      );
    } else {
      return GreetingModel(greeting: "Hello!👋", message: "Great to see you");
    }
  }
}
