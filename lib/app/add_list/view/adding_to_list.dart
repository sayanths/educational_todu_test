import 'package:banglore_task/app/add_list/controller/add_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddingToList extends StatelessWidget {
  const AddingToList({super.key});

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
                  animation: data.controller,
                  builder: (context, _) {
                    return Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                                height: 150,
                                width: 150,
                                child: CircularProgressIndicator(
                                  value: data.controller.value,
                                  color: const Color.fromARGB(255, 38, 0, 255),
                                )),
                            CustomText(title: data.countText)
                          ],
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.play_arrow,
                              size: 60,
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
              flex: 3,
              child: Column(
                children: [
                  const SizedBox(
                    height: 90,
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
              data.controller.reverse(
                  from:
                      data.controller.value == 0 ? 1.0 : data.controller.value);
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
