import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowEventPage extends StatelessWidget {
  const ShowEventPage(
      {super.key,
      required this.horizontalPadding,
      required this.verticalPadding});

  final double horizontalPadding;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(35)),
      //color: Colors.white,
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width,
      child: const Center(
          child: Text(
        'Events',
        style: TextStyle(fontSize: 25),
      )),
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
