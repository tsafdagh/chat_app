import 'package:chat_app/appTheme.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Chat',
      darkTheme: darkThemeData(context),
      theme: lightThemeData(context),
      themeMode: ThemeMode.system,
      getPages: [
        GetPage(name: Routes.SPLASH_SCREEN, page: () => SplashScreen()),
      ],
      initialRoute: Routes.SPLASH_SCREEN,
      home: const SplashScreen(),
    );
  }
}

class Routes {
  static const String SPLASH_SCREEN = "/";
}
