
import 'package:banglore_task/app/home_page/controller/theme_controller.dart';
import 'package:banglore_task/app/home_page/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themProvider = Get.put(ThemeController());
    return GetMaterialApp(
      title: 'Education App',
      debugShowCheckedModeBanner: false,
      themeMode: themProvider.themeMode,
      darkTheme: Mytheme.darkthem,
      theme: Mytheme.lightthem,
      home: const HomePage(),
    );
  }
}
