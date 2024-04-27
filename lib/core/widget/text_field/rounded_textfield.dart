import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  const RoundedTextField(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.icon,
      this.validator,
      this.suffixIcon,
      this.obscureText = false});

  final TextEditingController controller;
  final String labelText;
  final IconData icon;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(29),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // Change the shadow position if needed
          ),
        ],
      ),
      child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            icon: Icon(icon),
            iconColor: Colors.grey,
            labelText: labelText,
            suffixIcon: suffixIcon,
            labelStyle: const TextStyle(
              color: Colors.grey,
            ),
            errorStyle: const TextStyle(
              color: Colors.red,
            ),
            border: InputBorder.none,
          ),
          obscureText: obscureText,
          validator: validator),
    );
  }
}