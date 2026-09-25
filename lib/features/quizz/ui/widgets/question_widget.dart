import 'package:flutter/material.dart';
import 'package:project_2/core/constant/app_color.dart';

class QuestionWidget extends StatelessWidget {
  final String text;
  const QuestionWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            color: AppColor.kPrimaryColor2,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            textAlign: TextAlign.center,
            text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColor.kPrimaryColor1,
            ),
          ),
        ),
        Positioned(
          left: -20,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: AppColor.kPrimaryColor1,
          ),
        ),
        Positioned(
          right: -20,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: AppColor.kPrimaryColor1,
          ),
        ),
        Positioned(
          top: -40,
          child: CircleAvatar(
            radius: 40,
            backgroundColor: AppColor.kPrimaryColor2,
            child: Icon(Icons.check, size: 50, color: AppColor.kPrimaryColor5),
          ),
        ),
      ],
    );
  }
}
