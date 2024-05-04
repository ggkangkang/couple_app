import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar(
      {super.key,
      required this.horizontalPadding,
      required this.verticalPadding,
      this.title = '',
      this.color = Colors.white, this.onLogoutPressed});

  final double horizontalPadding;
  final double verticalPadding;
  final String title;
  final Color? color;
  final void Function()? onLogoutPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding, vertical: verticalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const IconButton(onPressed: null, icon: Text('')),
          const Spacer(),
          Text(
            title,
            style: GoogleFonts.bebasNeue(fontSize: 25, color: color),
          ),
          const Spacer(),
          IconButton(
              onPressed: onLogoutPressed,
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ))
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
