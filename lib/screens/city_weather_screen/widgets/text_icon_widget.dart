
import 'package:flutter/material.dart';

class TextIconWidget extends StatelessWidget {
  const TextIconWidget({
    Key? key,
    required this.text,
    required this.iconName,
    required this.textSize,
    required this.iconSize,
    required this.textIconColor,
  }) : super(key: key);

  final String? text;
  final IconData? iconName;
  final double? textSize;
  final double? iconSize;
  final Color? textIconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text!,
          style: TextStyle(
            fontSize: textSize,
            color: textIconColor,
            letterSpacing: 2,
          ),
        ),
        Icon(
          iconName,
          size: iconSize,
          color: textIconColor,
        ),
      ],
    );
  }
}

