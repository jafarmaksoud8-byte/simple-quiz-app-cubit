import 'package:flutter/material.dart';
import 'package:project_2/core/constant/app_color.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final VoidCallback onSelected;
  final bool isSelected;
  const ButtonWidget({
    super.key,
    required this.text,
    required this.width,
    required this.height,
    required this.onSelected,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected
            ? AppColor.kPrimaryColor4
            : AppColor.kPrimaryColor3,
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onPressed: onSelected,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: AppColor.kPrimaryColor1,
        ),
      ),
    );
  }
}
