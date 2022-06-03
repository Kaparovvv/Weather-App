import 'package:dio_package_app/screens/city_weather_screen/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ArrowButtonWidget extends StatelessWidget {
  ArrowButtonWidget({Key? key, required this.buttonText}) : super(key: key);
  final String buttonText;
  bool isTab = true;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 100,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: TextWidget(
            text: buttonText,
            fontSize: 15,
            textColor: Colors.blueGrey.shade400,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      onTap: () => Navigator.pop(context)
    );
  }
}
