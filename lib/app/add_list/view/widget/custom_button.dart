import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildButtonCreate(BuildContext contex) {
  var we = MediaQuery.of(contex).size.width;
  var he = MediaQuery.of(contex).size.height;
  return Container(
    width: we * 0.4,
    height: 50,
    margin: EdgeInsets.only(left: we * 0.45),
    child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF002FFF),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "New Task",
              style: GoogleFonts.lato(color: Colors.white),
            ),
            SizedBox(
              width: we * 0.03,
            ),
            const Icon(
              Icons.expand_less_outlined,
              color: Colors.white,
            )
          ],
        )),
  );
}
