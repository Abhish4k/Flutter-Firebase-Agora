import 'package:dio/dio.dart';
import 'package:flutter_agora_video_call/api_service/api_method.dart';
import 'package:flutter_agora_video_call/api_service/api_resource.dart';
import 'package:flutter_agora_video_call/api_service/api_url.dart';
import 'package:flutter_agora_video_call/api_service/rest_client.dart';
import 'package:flutter_agora_video_call/app_models/app_service_model/posts_model.dart';

class AppApiService extends RestClient {
  Future<ApiResource<PostsModel>> callGetPostApi() async {
    const String url = ApiUrl.getPosts;

    Map<String, dynamic> params = {};
    Map<String, dynamic> queryParams = {};

    FormData formData = FormData.fromMap({});

    ApiResource<PostsModel> postsModel = await request(
      PostsModel(),
      url,
      Method.GET,
      params,
      queryParams,
      formData,
    );
    return postsModel;
  }

  //   ///---------- call contact api ----------///
  // Future<ApiResource<DeleteAccountModel>> callDeleteAccountApi({ required userId}) async {
  //   const String url = ApiUrl.deleteAccount;

  //   Map<String, dynamic> params = {};
  //   Map<String, dynamic> queryParams = {};

  //   FormData formData = FormData.fromMap({
  //     userIdKey: userId,
  //   });

  //   ApiResource<DeleteAccountModel> deleteAccountModel = await request(
  //     DeleteAccountModel(),
  //     url,
  //     Method.POST,
  //     params,
  //     queryParams,
  //     formData,
  //   );

  //   return deleteAccountModel;
  // }
}
