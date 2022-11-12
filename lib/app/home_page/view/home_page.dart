import 'package:banglore_task/app/add_list/controller/add_list_controller.dart';
import 'package:banglore_task/app/add_list/view/adding_to_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Get.put(AddToListController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 28, 0, 184),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 28, 0, 184),
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        elevation: 0,
        title: Text(
          "Personal Manager",
          style: GoogleFonts.lato(
              fontSize: 20,
              letterSpacing: 2,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              Icons.sunny,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
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
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: const [
            //     CustomContainer(title: 'Personal'),
            //     CustomContainer(title: 'Business'),
            //     CustomContainer(title: 'Others'),
            //   ],
            // ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: size.height,
              child: Stack(
                children: [
                  Container(
                    height: size.height,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(60))),
                    child: Column(
                      children: [
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: LimitedBox(
                            maxHeight: size.height,
                            child: GridView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: 10,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 5,
                                      crossAxisSpacing: 5,
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                return Card(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 150, 113, 1),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Column(
                                      children: const [
                                        Expanded(
                                            child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: Text("data"),
                                        )),
                                        Expanded(flex: 2, child: Text("sdsdss"))
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: -20,
                    child: Image.asset(
                      "assets/image.png",
                      height: 150,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          data.controller.reverse(
              from: data.controller.value == 0 ? 1.0 : data.controller.value);
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
          color: const Color.fromARGB(255, 255, 0, 0),
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
