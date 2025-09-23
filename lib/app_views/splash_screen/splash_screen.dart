import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_agora_video_call/app_click_listeners/app_click_listeners.dart';
import 'package:flutter_agora_video_call/utils/app_color.dart';
import 'package:flutter_agora_video_call/utils/app_const_size.dart';
import 'package:flutter_agora_video_call/utils/app_images.dart';
import 'package:flutter_agora_video_call/utils/image_assets.dart';
import '../../utils/app_status_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // DataHelper.hideKeyboard();
    super.initState();
    goToNextScreen();
  }

  void goToNextScreen() {
    Future.delayed(Duration(milliseconds: 3000), () {
      if (FirebaseAuth.instance.currentUser != null) {
        AppClickListeners.goToDashboardScreen();
      } else {
        AppClickListeners.goToAuthScreen();
      }
    });
    // DataHelper.logValue("getUserId",
    //   AppStorageHelper.getUserId,
    // );
    // DataHelper.logValue("getUserEmail",
    //   AppStorageHelper.getUserEmail,
    // );
    // DataHelper.logValue("getUserDob",
    //   AppStorageHelper.getUserDob,
    // );
    // DataHelper.logValue("getUserName",
    //   AppStorageHelper.getUserName,
    // );
    // Future.delayed(
    //     const Duration(
    //       milliseconds: 3000,
    //     ), () {
    //   if (AppStorageHelper.getUserId.isNotEmpty) {
    //     AppClickListener.goToDashboard();
    //   } else {
    //     AppClickListener.goToAuthScreen();
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        }
        AppClickListeners.onAppExit();
      },
      child: Scaffold(
        backgroundColor: AppColor.white,
        appBar: appBarWithWhiteStatusBar,
        body: _splashView(),
      ),
    );
  }

  _splashView() => Center(
    child: imageAsset(
      image: AppImages.appLogo,
      width: AppConstSize.size300,
      height: AppConstSize.size500,
      // boxFit: BoxFit.fill,
    ),
  );
}
