import 'package:banglore_task/app/add_list/view/adding_to_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        elevation: 0,
        title: Text(
          "Personal Manager",
          style: GoogleFonts.lato(
              fontSize: 20,
              letterSpacing: 2,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              Icons.sunny,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Welcome",
                  style: GoogleFonts.lato(
                      fontSize: 30,
                      letterSpacing: 2,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                CustomContainer(title: 'Personal'),
                CustomContainer(title: 'Business'),
                CustomContainer(title: 'Others'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Todo List",
              style: GoogleFonts.lato(
                  fontSize: 20,
                  letterSpacing: 2,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Divider(
                height: 20,
                color: Colors.black,
                thickness: 1,
              ),
            ),
            Card(
              color: const Color.fromARGB(255, 246, 243, 219),
              child: SizedBox(
                height: 60,
                width: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "ds",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Get.to(
            () => const AddingToList(),
            transition: Transition.cupertino,
          );
        },
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final String title;
  const CustomContainer({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 60,
        width: 100,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 17, 17, 255),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
            child: Text(
          title,
          style: GoogleFonts.lato(
              fontSize: 15,
              letterSpacing: 2,
              color: const Color.fromARGB(255, 255, 253, 253),
              fontWeight: FontWeight.w400),
        )),
      ),
    );
  }
}
