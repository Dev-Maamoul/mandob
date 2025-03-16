
import 'package:company_project/utils/color_style.dart';
import 'package:flutter/material.dart';

class ActionButtonCustom extends StatelessWidget {
  const ActionButtonCustom({super.key, required this.title, this.onTap});
  final String title;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 200,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ColorStyle.primary,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(title, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
