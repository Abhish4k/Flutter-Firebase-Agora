import 'package:flutter/cupertino.dart';
import 'package:flutter_agora_video_call/app_models/app_ui_models/dashboard_ui_models/bottom_navigation_model/bottom_navigation_model.dart';
import 'package:flutter_agora_video_call/app_models/app_ui_models/auth_ui_models/otp_model.dart/otp_model.dart';
import 'package:flutter_agora_video_call/app_models/app_ui_models/dashboard_ui_models/home_ui_models/greetings_model/greeting_model.dart';
import 'package:flutter_agora_video_call/app_views/dashboard_screen/dashboard_sub_screen/connections_screen.dart';
import 'package:flutter_agora_video_call/app_views/dashboard_screen/dashboard_sub_screen/home_screen.dart';
import 'package:flutter_agora_video_call/app_views/dashboard_screen/dashboard_sub_screen/profile_screen.dart';
import 'package:flutter_agora_video_call/utils/app_images.dart';
import 'package:flutter_agora_video_call/utils/app_strings.dart';
import 'package:flutter_agora_video_call/utils/dashboard_screen_indexes.dart';
import 'package:get/get.dart';
import '../utils/app_text_controller.dart';

class DashboardController extends GetxController {
  FocusNode? oneFocus, twoFocus, threeFocus, fourFocus, fiveFocus, sixFocus;
  List<OtpModel> otpControllerList = <OtpModel>[];
  List<FocusNode> otpFocusList = <FocusNode>[];
  RxList<Widget> screenList = <Widget>[].obs;
  RxInt screenIndex = HOME_INDEX.obs;
  // RxList<BottomNavigationModel> homeList = <BottomNavigationModel>[].obs;

  @override
  void onInit() {
    onAppInit();
    super.onInit();
  }

  void onAppInit() {
    initFocusNode();
    getOtpFocusNode();
    getOtpList();
    // fetchScreenList();

    /*  onTap(
      index: HOME_INDEX,
    ); */
  }

  ///------------------------Auth Screen Functions---------------------///
  void initFocusNode() {
    oneFocus = FocusNode();
    twoFocus = FocusNode();
    threeFocus = FocusNode();
    fourFocus = FocusNode();
    fiveFocus = FocusNode();
    sixFocus = FocusNode();
  }

  ///--- load focus node in list [otpFocusList] ---///
  List<FocusNode> getOtpFocusNode() {
    otpFocusList = [
      oneFocus!,
      twoFocus!,
      threeFocus!,
      fourFocus!,
      fiveFocus!,
      sixFocus!,
    ];
    return otpFocusList;
  }

  ///--- load otp files with focus and un-focus node ---///
  List<OtpModel> getOtpList() {
    otpControllerList = [
      OtpModel(
        textEditingController: oneController,
        autoFocus: true,
        focusNode: oneFocus!,
      ),
      OtpModel(
        textEditingController: twoController,
        autoFocus: false,
        focusNode: twoFocus!,
      ),
      OtpModel(
        textEditingController: threeController,
        autoFocus: false,
        focusNode: threeFocus!,
      ),
      OtpModel(
        textEditingController: fourController,
        autoFocus: false,
        focusNode: fourFocus!,
      ),
      OtpModel(
        textEditingController: fiveController,
        autoFocus: false,
        focusNode: fiveFocus!,
      ),
      OtpModel(
        textEditingController: sixController,
        autoFocus: false,
        focusNode: sixFocus!,
      ),
    ];

    return otpControllerList;
  }

  ///------------------------Dashboard Screen Functions--------------------///

  RxList<Widget> fetchScreenList() {
    screenList.value = [HomeScreen(), ConnectionsScreen(), ProfileScreen()];
    return screenList;
  }

  List<BottomNavigationModel> fetchBottomNavigationBar() {
    List<BottomNavigationModel> bottomList = [];
    bottomList = [
      BottomNavigationModel(
        selectedImage: AppImages.homeSelectedIcon,
        unselectedImage: AppImages.homeUnselectedIcon,
        onTab: () {
          screenIndex.value = HOME_INDEX;
        },
        isSvg: false,
        title: AppStrings.home,
      ),
      BottomNavigationModel(
        selectedImage: AppImages.connectionsSelectedIcon,
        unselectedImage: AppImages.connectionsUnselectedIcon,
        onTab: () {
          screenIndex.value = CONNECTIONS_INDEX;
        },
        isSvg: false,
        title: AppStrings.connections,
      ),
      BottomNavigationModel(
        selectedImage: AppImages.profileSelectedIcon,
        unselectedImage: AppImages.profileUnselectedIcon,
        onTab: () {
          screenIndex.value = PROFILE_INDEX;
        },
        isSvg: false,
        title: AppStrings.profile,
      ),
    ];
    return bottomList;
  }

  ///------------------- Home Screen Functions --------------------///
  GreetingModel greetingText() {
    int hour = DateTime.now().hour;

    if (hour >= 0 && hour < 6) {
      return GreetingModel(
        greeting: "Good Night!🌙",
        message: "Hope you're having a peaceful rest",
      );
    } else if (hour >= 6 && hour < 12) {
      return GreetingModel(
        greeting: "Good Morning ☀️",
        message: "Have a wonderful day ahead",
      );
    } else if (hour == 12) {
      return GreetingModel(
        greeting: "Good Noon 🌞",
        message: "Perfect time for a lunch break",
      );
    } else if (hour >= 13 && hour < 17) {
      return GreetingModel(
        greeting: "Good Afternoon 🌤️",
        message: "Hope your day is going great",
      );
    } else if (hour >= 17 && hour < 20) {
      return GreetingModel(
        greeting: "Good Evening 🌅",
        message: "Time to wind down and relax",
      );
    } else if (hour >= 20 && hour <= 23) {
      return GreetingModel(
        greeting: "Good Night 🌙",
        message: "Sweet dreams and rest well",
      );
    } else {
      return GreetingModel(greeting: "Hello 👋", message: "Great to see you");
    }
  }

  /*  void onTap({
    required int index,
  }) {
    screenIndex.value = index;
    loadScreenData(
      index: index,
    );
  }
  */

  /* void loadScreenData({
    required int index,
  }) {
    switch (index) {
      case HOME_INDEX:
        getHomeData();
        break;

      case REPORT_INDEX:
        fetchReportData();
        break;

      case NOTIFICATION_INDEX:
        fetchNotificationData();
        break;

      case PROFILE_INDEX:
        getProfileData();
        break;
    }
  }
  */

  /*  void getHomeData() async {
    fetchHomeList();
    DashboardMixin.setHomeData = AppStrings.parkLocator;
    if (AppStorageHelper.getUserName.isNotEmpty) {
      DashboardMixin.setUserName = AppStorageHelper.getUserName;
    }
    await ParkMixin.callGetAllParkApi(
      filter: "",
    );
  } */

  /* void fetchNotificationData() async {
    await NotificationMixin.callNotificationApi();
  }  */

  /* void getProfileData() async {
    if (AppStorageHelper.getUserId.isNotEmpty) {
      await AuthMixin.callProfileInfoApi(
        userId: AppStorageHelper.getUserId,
      );
    }
  }
   */

  /* RxList<BottomNavigationModel> fetchHomeList() {
    homeList.value = [
      BottomNavigationModel(
        selectedImage: AppImages.locationIcon,
        unselectedImage: AppImages.locationIcon,
        onTab: () => AppClickListener.onTabParkButton(),
        isSvg: true,
        title: AppStrings.parkLocator,
      ),
      BottomNavigationModel(
        selectedImage: AppImages.workoutIcon,
        unselectedImage: AppImages.workoutIcon,
        onTab: () {},
        isSvg: true,
        title: AppStrings.workout,
      ),
    ];
    return homeList;
  } */

  void disposeFocusNode() {
    oneFocus!.dispose();
    twoFocus!.dispose();
    threeFocus!.dispose();
    fourFocus!.dispose();
    fiveFocus!.dispose();
    sixFocus!.dispose();
  }

  void onAppDispose() {
    disposeFocusNode();
  }

  @override
  void dispose() {
    onAppDispose();
    super.dispose();
  }
}
