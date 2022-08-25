import 'package:flutter/material.dart';
class IconContent extends StatelessWidget {

  IconContent({this.icon, this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30.0,
        ),
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(label,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white54,
          ),)
      ],
    );
  }
}