
import 'package:flutter/material.dart';

class ProfileDialog extends StatelessWidget {
  const ProfileDialog({
    super.key, required this.image, required this.name, this.onPressed,
  });

  final Image image;
  final String name;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
          contentPadding: const EdgeInsets.all(0),
          //title: Text('Test'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                //alignment: AlignmentDirectional.topEnd,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(28),
                            topRight: Radius.circular(28)),
                      ),
                      //color: Colors.grey,
                      child: image),
                  Positioned(
                    right: 0,
                    top: 0,
                    //alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: onPressed, icon: const Icon(Icons.edit)),
                  ),
                  Positioned(
                      left: 0,
                      bottom: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          name,
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.onPrimary,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ))
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(25.0),
                child: Text(
                  'Enter birthday',
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        );
  }
}