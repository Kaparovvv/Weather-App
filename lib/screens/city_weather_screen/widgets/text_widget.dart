import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.textColor,
    required this.fontWeight,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        letterSpacing: 3,
        fontWeight: fontWeight,
      ),
    );
  }
}

