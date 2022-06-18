import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const TextView(
      {Key? key,
      required this.text,
      required this.fontSize,
      required this.fontWeight, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontSize: fontSize, color: color, fontWeight: fontWeight));
  }
}
