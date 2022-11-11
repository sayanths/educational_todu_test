import 'package:banglore_task/app/add_list/controller/add_list_controller.dart';
import 'package:banglore_task/app/add_list/view/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddingToList extends StatelessWidget {
  const AddingToList({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Get.put(AddToListController());
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Expanded(
              flex: 1,
              child: GetBuilder<AddToListController>(builder: (data) {
                return AnimatedBuilder(
                  animation: data.controller,
                  builder: (context, _) {
                    return Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                                height: 100,
                                width: 100,
                                child: CircularProgressIndicator(
                                  value: data.progress,
                                  color: data.progress > 3
                                      ? const Color.fromARGB(255, 222, 91, 15)
                                      : const Color.fromARGB(255, 38, 0, 255),
                                )),
                            CustomText(title: data.countText)
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.play_arrow,
                              size: 50,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
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
        child: buildButtonCreate(context),
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
