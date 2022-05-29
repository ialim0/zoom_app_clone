import 'package:flutter/material.dart';
import 'package:zoom_apps/utils/colors.dart';

class ReuseableIcon extends StatelessWidget {
  final IconData icon;
  final String text;

  const ReuseableIcon({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 50,
          decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(
                16,
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(
                    0.7,
                  ),
                ),
              ]),
          child: Icon(
            icon,
            size: 30,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
        )
      ],
    );
  }
}
