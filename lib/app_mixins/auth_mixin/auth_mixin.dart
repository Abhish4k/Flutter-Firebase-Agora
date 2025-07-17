import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_agora_video_call/app_enums/auth_enums/auth_enums.dart';
import 'package:flutter_agora_video_call/app_models/auth_request_model.dart';
import 'package:get/get.dart';

mixin AuthMixin {
  static Rx<AuthEnum> authEnum = AuthEnum.signIn.obs;

  static Rx<AuthEnum> get getAuthEnum => authEnum;

  static set setAuthEnum(AuthEnum aEnum) {
    authEnum.value = aEnum;
  }

  //Firebase Method to Sign Up user with email and password
  static Future<UserCredential> signUpWithEmailAndPassword({
    required AuthRequestModel authRequestModel,
  }) async {
    return await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: authRequestModel.email.toString(),
      password: authRequestModel.password.toString(),
    );
  }

  static Future<UserCredential> signInWithEmailAndPassword({
    required AuthRequestModel authRequestModel,
  }) async {
    return await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: authRequestModel.email,
      password: authRequestModel.password,
    );
  }
}
