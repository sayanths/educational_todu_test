import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddToListController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final taskController = TextEditingController();
  final descriptionController = TextEditingController();

  late AnimationController controller;

  String get countText {
    Duration count = controller.duration! * controller.value;
    return ' ${(count.inMinutes % 10).toString().padLeft(2, '0')} : ${(count.inSeconds % 60).toString().padLeft(2, '0')} ';
  }

  @override
  void onInit() {
    super.onInit();
    controller =
        AnimationController(vsync: this, duration: const Duration(minutes: 60));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
