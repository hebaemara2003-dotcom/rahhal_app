import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:rahhal_app/home/home_screen.dart';
import 'package:rahhal_app/onBoarding_screen/onboarding_screen.dart';
import 'package:rahhal_app/utils/app_routes.dart';
import 'package:rahhal_app/camera/camera_screen.dart';
import 'package:rahhal_app/utils/app_themes.dart';

import 'onBoarding_screen/onboarding_data.dart';
List<CameraDescription>cameras = [];
Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      // routes: {
      //   AppRoutes.homeRouteName : (context) => HomeScreen(),
      //   AppRoutes.onboardingRouteName : (context) => OnboardingScreen(index: 0),
      //   AppRoutes.cameraRouteName : (context) => CameraScreen(),
      //
      //
      //
      //
      // } ,
      themeMode: ThemeMode.light,
    );
  }
}
