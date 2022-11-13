import 'package:banglore_task/app/home_page/model/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class CrudOperation {
  Future<void> create(Model value);
  Future<List<Model>> getAllList();
  Future<void> read();
  // Future<void> update(String index, Model value);
  Future<void> delete(String id);
}

class ThemeController extends GetxController {
  List<Model> list = [];
  String dbName = 'user';
  Future<void> createItem(Model note) async {
    Box<Model> box = await Hive.openBox<Model>(dbName);
    box.add(note);
    update();
  }

  Future<List<Model>> getItems() async {
    Box<Model> box = await Hive.openBox<Model>(dbName);
    return box.values.toList();
   
  }

  

  Future<void> addItem(Model note) async {
    Box<Model> box = await Hive.openBox<Model>(dbName);
    await box.delete(note.id);
    list = box.values.toList();
    update();
  }



  Future<void> updatestudent(int id, Model studentupvalue) async {
    final studentDB = await Hive.openBox<Model>(dbName);
    await studentDB.put(id, studentupvalue);
    await getItems();
  }

  @override
  void onInit() {
    getItems();
    super.onInit();
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
