import 'package:attendance_app/binding/initial_binding.dart';
import 'package:attendance_app/core/theme/app_theme.dart';
import 'package:attendance_app/features/stores/ui/list/stores_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Attendance App',
      theme: AppTheme.lightTheme(),
      themeMode: ThemeMode.light,
      initialBinding: InitialBinding(),
      home: StoresScreen(),
    );
  }
}
