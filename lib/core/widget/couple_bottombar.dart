import 'package:flutter/material.dart';

class CoupleBottomBar extends StatelessWidget {
  const CoupleBottomBar(
      {super.key, required this.currentIndex, required this.onTap, required this.items});

  final int currentIndex;
  final Function(int) onTap;
  final List<BottomNavigationBarItem> items;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
          elevation: 0.0,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme: const IconThemeData(size: 30),
          currentIndex: currentIndex,
          onTap: onTap,
          items: items),
    );
  }
}
