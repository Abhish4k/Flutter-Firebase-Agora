import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_agora_video_call/app_Routes/app_routes.dart';
import 'package:flutter_agora_video_call/app_Routes/routes.dart';
import 'package:flutter_agora_video_call/app_controller/dashboard_controller.dart';
import 'package:flutter_agora_video_call/firebase_options.dart';
import 'package:flutter_agora_video_call/utils/app_binding.dart';
import 'package:get/get.dart';

final dashboardController = Get.put(DashboardController(), permanent: true);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.authScreen,
      initialBinding: AppBinding(),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
