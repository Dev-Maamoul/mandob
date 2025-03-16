
import 'package:company_project/utils/color_style.dart';
import 'package:flutter/material.dart';

class LabelColumn extends StatelessWidget {
  const LabelColumn({super.key, required this.title, required this.value});
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title:",
          style: TextStyle(
            color: Colors.black,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: ColorStyle.primary,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
