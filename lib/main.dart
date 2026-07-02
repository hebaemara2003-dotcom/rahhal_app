import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:rahhal_app/home/home_screen.dart';
import 'package:rahhal_app/onBoarding_screen/onboarding_screen.dart';
import 'package:rahhal_app/utils/app_routes.dart';
import 'package:rahhal_app/camera/camera_screen.dart';
import 'package:app_links/app_links.dart';
import 'package:rahhal_app/utils/app_themes.dart';

import 'onBoarding_screen/onboarding_data.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
List<CameraDescription>cameras = [];
Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppLinks appLinks = AppLinks();
  @override
  @override
  void initState() {
    super.initState();

    _initDeepLink();
  }

  Future<void> _initDeepLink() async {
    final Uri? initialLink = await appLinks.getInitialLink();

    if (initialLink != null) {
      print("Initial Link: $initialLink");
      print("Email: ${initialLink.queryParameters['email']}");
      print("Token: ${initialLink.queryParameters['token']}");
    }

    appLinks.uriLinkStream.listen((Uri uri) {
      print("Deep Link: $uri");
      print("Email: ${uri.queryParameters['email']}");
      print("Token: ${uri.queryParameters['token']}");
    });
  }
  Widget build(BuildContext context) {
    return MaterialApp(
    navigatorKey: navigatorKey,
    debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.onboardingRouteName,
      routes: {
        AppRoutes.homeRouteName : (context) => HomeScreen(),
        AppRoutes.onboardingRouteName : (context) => OnboardingScreen(index: 0),
        AppRoutes.cameraRouteName : (context) => CameraScreen(),




      } ,
      themeMode: ThemeMode.light,
    );
  }
}
