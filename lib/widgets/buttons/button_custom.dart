import 'package:company_project/utils/color_style.dart';
import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({super.key, this.onPressed});
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        height: 45,
        width: 200,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ColorStyle.primary,

          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          "Get Login OTP",
          style: TextStyle(
            color: ColorStyle.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
