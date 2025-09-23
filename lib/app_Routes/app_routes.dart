import 'package:flutter_agora_video_call/app_Routes/routes.dart';
import 'package:flutter_agora_video_call/app_views/auth_screen/auth_screen.dart';
import 'package:flutter_agora_video_call/app_views/dashboard_screen/dashboard_screen.dart';
import 'package:flutter_agora_video_call/app_views/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static List<GetPage> appRoutes() => [
    ///----- Splash Screen------///
    GetPage(name: Routes.splashScreen, page: () => SplashScreen()),

    ///----- Auth Screen------///
    GetPage(name: Routes.authScreen, page: () => AuthScreen()),

    ///----- Dashboard Screen------///
    GetPage(name: Routes.dashboardScreen, page: () => DashboardScreen()),
  ];
}
