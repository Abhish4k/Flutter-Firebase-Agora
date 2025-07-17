import 'package:flutter_agora_video_call/app_api_service/app_api_service.dart';
import 'package:flutter_agora_video_call/app_models/app_service_model/posts_data_model.dart';
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
}
