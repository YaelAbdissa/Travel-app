import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  const AppLargeText({
    Key? key,
    required this.text,
    this.size = 30,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontSize: size, color: color, fontWeight: FontWeight.bold),
    );
  }
}
