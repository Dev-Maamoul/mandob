import 'package:flutter/material.dart';

class LabelCustomWithTitle extends StatelessWidget {
  const LabelCustomWithTitle({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$title:",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 12,
          ),
        ),
        SizedBox(width: 4),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            color:
                value == "true"
                    ? Colors.green
                    : value == "false"
                    ? Colors.red
                    : Colors.black,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
