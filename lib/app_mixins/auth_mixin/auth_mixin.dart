import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_agora_video_call/app_enums/auth_enums/auth_enums.dart';
import 'package:flutter_agora_video_call/app_models/app_request_models/auth_request_model.dart';
import 'package:flutter_agora_video_call/helper/data_helper.dart';
import 'package:flutter_agora_video_call/utils/app_color.dart';
import 'package:get/get.dart';

mixin AuthMixin {
  static Rx<AuthEnum> authEnum = AuthEnum.signIn.obs;

  static Rx<AuthEnum> get getAuthEnum => authEnum;

  static set setAuthEnum(AuthEnum aEnum) {
    authEnum.value = aEnum;
  }

  //Firebase Method to Sign Up user with email and password
  static Future<UserCredential?> signUpWithEmailAndPassword({
    required AuthRequestModel authRequestModel,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: authRequestModel.email.toString(),
            password: authRequestModel.password.toString(),
          );
      await saveUserProfile(authRequestModel: authRequestModel);
      return userCredential;
    } on FirebaseAuthException catch (execption) {
      DataHelper.showAppToast(
        message: execption.message!,
        bkgColor: AppColor.redColor,
      );
      return null;
    }
  }

  static Future<UserCredential?> signInWithEmailAndPassword({
    required AuthRequestModel authRequestModel,
  }) async {
    try {
      return await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: authRequestModel.email,
        password: authRequestModel.password,
      );
    } on FirebaseAuthException catch (e) {
      DataHelper.showAppToast(message: e.message!, bkgColor: AppColor.redColor);
      return null;
    }
  }

  static Future<void> saveUserProfile({
    required AuthRequestModel authRequestModel,
  }) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        return await FirebaseFirestore.instance
            .collection("user-profiles")
            .doc(user.uid)
            .set({
              "firstName": authRequestModel.firstName.toString(),
              "lastName": authRequestModel.lastName.toString(),
              "email": authRequestModel.email.toString(),
              "phoneNumber": authRequestModel.phoneNumber.toString(),
              "dob": authRequestModel.dob.toString(),
              "createdAt": FieldValue.serverTimestamp(),
            });
      } on FirebaseException catch (e) {
        DataHelper.showAppToast(
          message: e.message ?? "Failed to save profile",
          bkgColor: AppColor.redColor,
        );
      }
    }
  }
}
