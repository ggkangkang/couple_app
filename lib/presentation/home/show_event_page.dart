import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      //height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width,
      child: Center(
          child: ListView.separated(
        itemCount: 5,
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text(
              'First Day',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black54),
            ),
            subtitle: Text(
              '14 Oct, 2024',
              style: TextStyle(color: Colors.black54),
            ),
          ),
        ),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Divider(
            color: Colors.grey[300],
          ),
        ),
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
