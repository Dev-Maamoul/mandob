import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardDisplay extends StatelessWidget {
  const CardDisplay({
    super.key,
    required this.title,
    required this.titleValue,
    required this.subTitle,
    this.size = 200,
  });
  final String title;
  final num titleValue;
  final String subTitle;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: size,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/Group 38764.svg',
            semanticsLabel: 'Red dash paths',
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$titleValue $title".trim(),
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(subTitle, style: TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
