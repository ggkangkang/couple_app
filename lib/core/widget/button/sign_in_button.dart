import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignInButton extends StatelessWidget {
  SignInButton({super.key, this.onPressed, required this.button});

  final void Function()? onPressed;
  Color? _backgroundColor;
  final Button button;
  Widget? icon;

  @override
  Widget build(BuildContext context) {
    switch (button) {
      case (Button.facebook):
        _backgroundColor = const Color(0xFF1877F2);
        icon = const Icon(
          Icons.facebook,
          color: Colors.white,
        );
        break;

      case Button.google:
        //_backgroundColor = Colors.white;
        icon = Image.asset(
          "assets/icon/google.png",
          width: 20,
        );
        break;

      case Button.apple:
        _backgroundColor = Colors.black;
        icon = const Icon(
          Icons.apple,
          color: Colors.white,
        );
        break;
    }

    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            
            backgroundColor: _backgroundColor,
            shape: const CircleBorder()),
        onPressed: onPressed,
        child: icon);
  }
}

enum Button { google, facebook, apple }
