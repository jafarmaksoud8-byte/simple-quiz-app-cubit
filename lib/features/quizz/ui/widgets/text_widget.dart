import 'package:flutter/material.dart';
import 'package:project_2/core/constant/app_color.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  const TextWidget({super.key, required this.text, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: AppColor.kPrimaryColor2,
      ),
    );
  }
}
