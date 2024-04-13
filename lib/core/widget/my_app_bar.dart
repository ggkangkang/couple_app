import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar(
      {super.key,
      required this.horizontalPadding,
      required this.verticalPadding,
      this.title = ''});

  final double horizontalPadding;
  final double verticalPadding;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding, vertical: verticalPadding),
      child: Column(
        children: [
          Center(
            child: Text(
              title,
              style: GoogleFonts.bebasNeue(fontSize: 25, color: Colors.white),
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Image.asset(
          //       "assets/icon/more.png",
          //       height: 45,
          //       //color: const Color.fromARGB(255, 239, 132, 132),
          //     ),
          //     const Icon(
          //       Icons.person,
          //       size: 45,
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }
}
