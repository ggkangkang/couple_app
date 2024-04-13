import 'package:coupple_app/core/const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowDayPage extends StatelessWidget {
  const ShowDayPage(
      {super.key,
      required this.horizontalPadding,
      required this.verticalPadding});

  final double horizontalPadding;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.all(50),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: primaryColor.withOpacity(0.6)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Together for',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                Text(
                  '243',
                  style: GoogleFonts.bebasNeue(
                      fontSize: 40, color: Colors.red[200]),
                ),
                const Text(
                  'Aug 15, 2023',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 100,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              iconWithLabel('Baby', 'assets/icon/man.png'),
              Image.asset(
                "assets/icon/heart.png",
                height: 35,
              ),
              iconWithLabel('Cutie Pie', 'assets/icon/woman.png')
            ],
          ),
        ),
      ],
    );
  }

  Column iconWithLabel(String label, String imagePath) {
    return Column(
      children: [
        CircleAvatar(
          maxRadius: 30,
          backgroundImage: AssetImage(imagePath),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(label)
      ],
    );
  }
}
