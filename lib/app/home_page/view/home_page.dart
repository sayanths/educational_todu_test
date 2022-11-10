import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Personal Manager",
          style: GoogleFonts.lato(
              fontSize: 25,
              letterSpacing: 2,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [
          Icon(
            Icons.sunny,
            color: Colors.black,
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: const [],
        ),
      ),
    );
  }
}
