import 'package:flutter_agora_video_call/app_models/app_service_model/posts_data_model.dart';

import '../../api_service/api_object.dart';

class PostsModel extends ApiObject<PostsModel> {
  String? message;
  int? code;
  List<PostsDataModel>? postsList;

  PostsModel({this.message, this.postsList, this.code});

  @override
  PostsModel fromMap(dynamicData) {
    if (dynamicData != null) {
      return PostsModel(
        code: dynamicData['code'],
        message: dynamicData['message'] ?? "",
        //When data is a list of object
        postsList: dynamicData['data'] == null
            //  || dynamicData['data']['posts'] == null
            ? []
            : List<PostsDataModel>.from(
                // when response coming like "data" : { 'posts':[{obj1},{obj2}]}
                //and if data comes like "data" : [{obj1},{obj2}] then use
                //   (dynamicData['data'] as List).map(
                //   (x) => PostsDataModel().fromMap(x),
                // ),
                dynamicData['data']
                // ['posts']
                .map((x) => PostsDataModel().fromMap(x)),
              ),
        // When data is simmple object like "data": {obj}
        //  dynamicData['data'] == null
        //     ? null
        //     : PostsModel().fromMap(
        //         dynamicData['data'],
        //       ),
      );
    }
    return dynamicData;
  }

  @override
  List<PostsModel> fromMapList(List dynamicDataList) {
    final List<PostsModel> postsModel = <PostsModel>[];

    for (dynamic json in dynamicDataList) {
      if (json != null) {
        postsModel.add(fromMap(json));
      }
    }
    return postsModel;
  }

  @override
  String? getPrimaryKey() {
    return code.toString();
  }

  @override
  Map<String, dynamic>? toMap(PostsModel object) {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (object != null) {
      data['code'] = object.code;
      data['message'] = object.message;
      data['data'] =
          //When Data is List
          object.postsList != []
          ? List<PostsDataModel>.from(
              object.postsList!.map((x) => PostsDataModel().toMap(x)),
            )
          : [];

      //When data is an object
      // object.data != null
      // ? PostsModel().toMap(
      //     object.data!,
      //   )
      // : null;
      return data;
    } else {
      return null;
    }
  }

  @override
  List<Map<String, dynamic>?> toMapList(List<PostsModel> objectList) {
    final List<dynamic> dynamicList = <dynamic>[];
    for (dynamic data in objectList) {
      if (data != null) {
        dynamicList.add(toMap(data));
      }
    }

    return dynamicList as List<Map<String, dynamic>?>;
  }
}
