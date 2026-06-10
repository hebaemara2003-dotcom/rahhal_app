import 'package:flutter/material.dart';
import 'package:rahhal_app/home/home_screen.dart';
import 'package:rahhal_app/onBoarding_screen/onboarding_screen.dart';
import 'package:rahhal_app/utils/app_routes.dart';
import 'package:rahhal_app/utils/app_themes.dart';

import 'onBoarding_screen/onboarding_data.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.onboardingRouteName,
      routes: {
        AppRoutes.homeRouteName : (context) => HomeScreen(),
        AppRoutes.onboardingRouteName : (context) => OnboardingScreen(index: 0),


      } ,
      themeMode: ThemeMode.light,
    );
  }
}
