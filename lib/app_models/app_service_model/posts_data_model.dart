import 'package:flutter_agora_video_call/api_service/api_object.dart';

class PostsDataModel extends ApiObject<PostsDataModel> {
  String? body, title;
  int? id, userId;

  PostsDataModel({this.body, this.id, this.title, this.userId});

  @override
  PostsDataModel fromMap(dynamicData) {
    if (dynamicData != null) {
      return PostsDataModel(
        body: dynamicData['body'] ?? "",
        id: dynamicData['id'] ?? 0,
        title: dynamicData['title'] ?? "",
        userId: dynamicData['userId'] ?? 0,
      );
    }
    return dynamicData;
  }

  @override
  Map<String, dynamic>? toMap(PostsDataModel object) {
    final Map<String, dynamic> data = <String, dynamic>{};
    // if (object != null) {
    data['body'] = object.body;
    data['id'] = object.id;
    data['title'] = object.title;
    data['userId'] = object.userId;
    return data;
    // } else {
    //   return null;
    // }
  }

  @override
  List<PostsDataModel> fromMapList(List dynamicDataList) {
    final List<PostsDataModel> faqListModel = <PostsDataModel>[];

    for (dynamic json in dynamicDataList) {
      if (json != null) {
        faqListModel.add(fromMap(json));
      }
    }
    return faqListModel;
  }

  @override
  String? getPrimaryKey() {
    return id.toString();
  }

  @override
  List<Map<String, dynamic>?> toMapList(List<PostsDataModel> objectList) {
    final List<dynamic> dynamicList = <dynamic>[];
    for (dynamic data in objectList) {
      if (data != null) {
        dynamicList.add(toMap(data));
      }
    }

    return dynamicList as List<Map<String, dynamic>?>;
  }
}
