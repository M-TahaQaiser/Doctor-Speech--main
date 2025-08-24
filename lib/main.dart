import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:TinyDragonTherapy/screens/splash_screen.dart';
import 'package:TinyDragonTherapy/themes/theme_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Tiny Dragon',
          theme: ThemeStyle.lightTheme,
          home: child,
        );
      },
      child: const SplashScreen(),
    );
  }
}
