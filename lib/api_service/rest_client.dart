import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_agora_video_call/api_service/api_method.dart';
import 'package:flutter_agora_video_call/api_service/api_object.dart';
import 'package:flutter_agora_video_call/api_service/api_resource.dart';
import 'package:flutter_agora_video_call/api_service/api_response.dart';
import 'package:flutter_agora_video_call/api_service/api_url.dart';
import 'package:flutter_agora_video_call/helper/data_helper.dart';
import 'package:flutter_agora_video_call/utils/app_color.dart';
import 'package:flutter_agora_video_call/utils/app_strings.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class RestClient extends GetxService {
  late Dio dio;
  String authToken = "";
  static header() => {'Content-Type': 'application/json'};

  ApiResource<T> psObjectConvert<T>(dynamic dataList, T data) {
    return ApiResource<T>(dataList.code, dataList.message, data);
  }

  // Dio Initialization

  Future<RestClient> init() async {
    dio = Dio(BaseOptions(baseUrl: ApiUrl.baseUrl, headers: header()));
    initInterceptors();
    return this;
  }

  void initInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          DataHelper.logValue("headers", options.headers);
          return handler.next(options);
        },
        onResponse: (response, handler) {
          DataHelper.logValue("RESPONSE", '[${response.data}]');
          return handler.next(response);
        },
        onError: (error, handler) {
          DataHelper.logValue("ERROR", error.error);
          DataHelper.isLoading.value = false;
          return handler.next(error);
        },
      ),
    );
  }

  Future<ApiResource<R>> request<T extends ApiObject<dynamic>, R>(
    T obj,
    String url,
    Method method,
    Map<String, dynamic> params,
    Map<String, dynamic> queryParams,
    FormData formData,
  ) async {
    Response response;
    init();

    String baseUrl = "";
    if (url.contains(ApiUrl.baseUrl)) {
      baseUrl = url;
    } else {
      baseUrl = "${ApiUrl.baseUrl}$url";
    }

    DataHelper.logValue(
      "base url",
      "$baseUrl,,,$params,,,,$queryParams,,,,,${formData.fields}",
    );
    try {
      if (method == Method.POST) {
        if (queryParams.isNotEmpty) {
          response = await dio.post(
            baseUrl,
            data: queryParams,
            queryParameters: params,
          );
        } else if (formData.fields.isNotEmpty) {
          response = await dio.post(baseUrl, data: formData);
        } else {
          response = await dio.post(baseUrl, data: params);
        }
      } else if (method == Method.PATCH) {
        response = await dio.patch(url);
      } else if (method == Method.PUT) {
        response = await dio.put(url);
      } else if (method == Method.DELETE) {
        response = await dio.delete(url);
      } else {
        response = await dio.get(baseUrl, queryParameters: params);
      }

      DataHelper.logValue("response", response);
      final ApiResponse psApiResponse = ApiResponse(response);
      DataHelper.isLoading.value = false;

      if (psApiResponse.isSuccessful) {
        DataHelper.logValue("isSuccessful", response.data);

        //  If the response is successful (status 200/201):
        //  Checks if the data is a list (like a list of posts) or a single Map object.
        //  If it’s a list: Converts each item in the list into a Dart object using your model’s fromMap method.

        final dynamic hashMap = response.data;
        if (hashMap is! Map) {
          final List<T> tList = <T>[];
          hashMap.forEach((dynamic data) {
            tList.add(obj.fromMap(data as dynamic));
            DataHelper.logValue("objToMap", obj.fromMap(data as dynamic));
          });
          return ApiResource<R>(
            int.parse(response.data['code'].toString()),
            response.data['message'] ?? "",
            tList as R? ?? R as R,
          );
        } else {
          DataHelper.logValue('code', response.data['code']);
          return ApiResource<R>(
            int.parse(response.data['code'].toString()),
            response.data['message'] ?? "",
            obj.fromMap(hashMap),
          );
        }
      } else {
        return ApiResource<R>(
          response.statusCode!,
          psApiResponse.errorMessage,
          null,
        );
      }
    } on DioError catch (e) {
      DataHelper.isLoading.value = false;
      if (await DataHelper.checkUserConnection()) {
        DataHelper.showAppToast(
          message: AppStrings.timeoutError,
          bkgColor: AppColor.dotColor,
        );
      } else {
        DataHelper.showAppToast(
          message: AppStrings.checkInternetConnection,
          bkgColor: AppColor.dotColor,
        );
      }
      DataHelper.logValue("dioResponse", "${e.message}");
      throw Exception("No address asscociated with hostname ${ApiUrl.baseUrl}");
    } on SocketException catch (e) {
      DataHelper.isLoading.value = false;

      throw Exception("No Internet Connection ${e.message}");
    } on FormatException {
      DataHelper.isLoading.value = false;
      throw Exception("Bad Response Format!");
    }
  }

  Future<dynamic> mapRequest({required String url}) async {
    init();
    Response response;
    response = await dio.get(url);
    if (response.statusCode == 200) {
      return response.data;
    }
  }
}
