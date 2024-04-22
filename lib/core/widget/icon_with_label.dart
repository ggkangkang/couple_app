import 'package:flutter/material.dart';

class IconWithLabel extends StatelessWidget {
  const IconWithLabel({
    super.key,
    required this.label,
    required this.imagePath,
    this.onTap
  });

  final String label;
  final String imagePath;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
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
      ),
    );
  }
}