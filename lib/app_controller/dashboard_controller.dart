import 'package:flutter/cupertino.dart';
import 'package:flutter_agora_video_call/app_models/otp_model.dart/otp_model.dart';
import 'package:get/get.dart';
import '../utils/app_text_controller.dart';

class DashboardController extends GetxController {
  FocusNode? oneFocus, twoFocus, threeFocus, fourFocus, fiveFocus, sixFocus;
  List<OtpModel> otpControllerList = <OtpModel>[];
  List<FocusNode> otpFocusList = <FocusNode>[];
  // RxInt screenIndex = HOME_INDEX.obs;
  RxList<Widget> screenList = <Widget>[].obs;
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

    // onTap(
    //   index: HOME_INDEX,
    // );
  }

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

  // RxList<Widget> fetchScreenList() {
  //   screenList.value = [
  //     // const HomeScreen(),
  //     // const ReportScreen(),
  //     // const NotificationScreen(),
  //     // const ProfileScreen(),
  //   ];

  //   return screenList;
  // }

  // void onTap({
  //   required int index,
  // }) {
  //   screenIndex.value = index;
  //   loadScreenData(
  //     index: index,
  //   );
  // }

  // void loadScreenData({
  //   required int index,
  // }) {
  //   switch (index) {
  //     case HOME_INDEX:
  //       getHomeData();
  //       break;

  //     case REPORT_INDEX:
  //       fetchReportData();
  //       break;

  //     case NOTIFICATION_INDEX:
  //       fetchNotificationData();
  //       break;

  //     case PROFILE_INDEX:
  //       getProfileData();
  //       break;
  //   }
  // }

  // void getHomeData() async {
  //   fetchHomeList();
  //   DashboardMixin.setHomeData = AppStrings.parkLocator;
  //   if (AppStorageHelper.getUserName.isNotEmpty) {
  //     DashboardMixin.setUserName = AppStorageHelper.getUserName;
  //   }
  //   await ParkMixin.callGetAllParkApi(
  //     filter: "",
  //   );
  // }

  // void fetchNotificationData() async {
  //   await NotificationMixin.callNotificationApi();
  // }

  // void getProfileData() async {
  //   if (AppStorageHelper.getUserId.isNotEmpty) {
  //     await AuthMixin.callProfileInfoApi(
  //       userId: AppStorageHelper.getUserId,
  //     );
  //   }
  // }

  // List<BottomNavigationModel> fetchBottomNavigationBar() {
  //   List<BottomNavigationModel> bottomList = [];
  //   // BuildContext context;
  //   bottomList = [
  //     BottomNavigationModel(
  //       selectedImage: AppImages.homeSelectedIcon,
  //       unselectedImage: AppImages.homeUnselectedIcon,
  //       onTab: () => AppClickListener.onTabHome(),
  //       isSvg: true,
  //       title: AppStrings.home,
  //     ),
  //     BottomNavigationModel(
  //       selectedImage: AppImages.reportSelectedIcon,
  //       unselectedImage: AppImages.reportUnselectedIcon,
  //       onTab: () => AppClickListener.onTabReport(),
  //       isSvg: true,
  //       title: AppStrings.report,
  //     ),
  //     BottomNavigationModel(
  //       selectedImage: AppImages.notificationSelectedIcon,
  //       unselectedImage: AppImages.notificationUnselectedIcon,
  //       onTab: () => AppClickListener.onTabNotification(),
  //       isSvg: true,
  //       title: AppStrings.notifications,
  //     ),
  //     BottomNavigationModel(
  //       selectedImage: AppImages.demiUserImg,
  //       unselectedImage: AppStorageHelper.getUserImage,
  //       onTab: () => AppClickListener.onTabProfile(),
  //       isSvg: false,
  //       title: AppStrings.profile,
  //     ),
  //   ];
  //   return bottomList;
  // }

  // RxList<BottomNavigationModel> fetchHomeList() {
  //   homeList.value = [
  //     BottomNavigationModel(
  //       selectedImage: AppImages.locationIcon,
  //       unselectedImage: AppImages.locationIcon,
  //       onTab: () => AppClickListener.onTabParkButton(),
  //       isSvg: true,
  //       title: AppStrings.parkLocator,
  //     ),
  //     BottomNavigationModel(
  //       selectedImage: AppImages.workoutIcon,
  //       unselectedImage: AppImages.workoutIcon,
  //       onTab: () {},
  //       isSvg: true,
  //       title: AppStrings.workout,
  //     ),
  //   ];

  //   return homeList;
  // }

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
