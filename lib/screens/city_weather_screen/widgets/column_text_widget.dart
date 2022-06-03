import 'package:dio_package_app/screens/city_weather_screen/widgets/text_icon_widget.dart';
import 'package:flutter/material.dart';

class ColumnTextWidget extends StatelessWidget {
  const ColumnTextWidget({
    Key? key,
    required this.name,
    required this.text,
    required this.iconName,
    required this.textSize,
    required this.iconSize,
    required this.textIconColor,
  }) : super(key: key);

  final String name;
  final String? text;
  final IconData? iconName;
  final double? textSize;
  final double? iconSize;
  final Color? textIconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextIconWidget(
          text: text!,
          iconName: iconName!,
          textSize: textSize!,
          iconSize: iconSize!,
          textIconColor: textIconColor!,
        ),
        Text(
          name,
          style: TextStyle(color: Colors.grey.shade200),
        ),
      ],
    );
  }
}