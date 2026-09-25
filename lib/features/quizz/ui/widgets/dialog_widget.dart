import 'package:flutter/material.dart';
import 'package:project_2/core/constant/app_color.dart';

class DialogWidget extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onReset;
  const DialogWidget({
    super.key,
    required this.text,
    required this.color,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        text,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.kPrimaryColor2,
            minimumSize: Size(200, 60),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: onReset,
          child: Text(
            'Reset',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: AppColor.kPrimaryColor1,
            ),
          ),
        ),
      ],
    );
  }
}
