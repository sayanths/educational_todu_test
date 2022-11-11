import 'package:banglore_task/app/add_list/controller/add_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddingToList extends StatefulWidget {
  const AddingToList({super.key});

  @override
  State<AddingToList> createState() => _AddingToListState();
}

class _AddingToListState extends State<AddingToList>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  String get countText {
    Duration count = controller.duration! * controller.value;
    return '${(count.inHours ).toString().padLeft(2, '0')}  :${(count.inMinutes ~/6).toString().padLeft(2, '0')} : ${(count.inSeconds % 60).toString().padLeft(2, '0')} ';
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(minutes: 60));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = Get.put(AddToListController());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Expanded(
              flex: 1,
              child: GetBuilder<AddToListController>(builder: (data) {
                return AnimatedBuilder(
                  animation: controller,
                  builder: (context, _) {
                    return Column(
                      children: [
                        CustomText(title: countText),
                        GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.play_arrow,
                            size: 60,
                          ),
                        )
                      ],
                    );
                  },
                );
              }),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  CustomTextFormField(
                      data: data,
                      controller: data.taskController,
                      title: 'Task Name'),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                      data: data,
                      controller: data.taskController,
                      title: 'Description (optional)'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: ElevatedButton(
            onPressed: () {
              controller.reverse(
                  from: controller.value == 0 ? 1.0 : controller.value);
            },
            child: const Text("Submit")),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String title;
  const CustomText({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Text(
        title,
        style: GoogleFonts.lato(
            fontSize: 20,
            letterSpacing: 2,
            color: Colors.black,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String? Function(String?)? validate;
  const CustomTextFormField({
    Key? key,
    required this.data,
    required this.controller,
    required this.title,
    this.validate,
  }) : super(key: key);

  final AddToListController data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        validator: validate,
        controller: controller,
        decoration: InputDecoration(
          hintText: title,
        ),
      ),
    );
  }
}
