import 'package:coupple_app/core/const.dart';
import 'package:flutter/material.dart';

class CoupleBody extends StatelessWidget {
  const CoupleBody({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        
        gradient: LinearGradient(
            colors: [primaryColor, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.0, 0.22]),
      ),
      child: SafeArea(child: child),
    );
  }
}
