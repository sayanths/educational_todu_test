import 'dart:ffi';

import 'package:banglore_task/app/home_page/model/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CrudOperation {
  Future<void> create(Model value);
  Future<List<Model>> getAllList();
  Future<void> read();
 // Future<void> update(String index, Model value);
  Future<void> delete(String id);
}

class ThemeController extends GetxController with CrudOperation {
  // ThemeMode themeMode = ThemeMode.system;
  // bool get isDarkMode => themeMode == ThemeMode.light;

  // void toggleThem(bool isOne) {
  //   themeMode = isOne ? ThemeMode.dark : ThemeMode.light;
  //   update();
  // }

  @override
  Future<void> create(Model value) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<void> read() {
    // TODO: implement read
    throw UnimplementedError();
  }
  
  @override
  Future<List<Model>> getAllList() {
    // TODO: implement getAllList
    throw UnimplementedError();
  }
}

class Mytheme {
  static final darkthem = ThemeData(
      scaffoldBackgroundColor: const Color(0xff3450A1),
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xff3450A1)),
      primaryColor: Colors.white,
      cardColor: const Color(0xff0A155A),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFFF00FF)));

  static final lightthem = ThemeData(
    scaffoldBackgroundColor: const Color(0xffF4F6FD),
    primaryColor: Colors.black,
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Color(0xFF002FFF)),
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xffF4F6FD)),
  );
}
