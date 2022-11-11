import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddToListController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final taskController = TextEditingController();
  final descriptionController = TextEditingController();
}
