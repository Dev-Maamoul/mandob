import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({
    super.key,
    required this.title,
    required this.subTitle,
    this.onTap,
    this.colorBG = Colors.white,
    this.colorText = Colors.black,
    this.icon,
  });
  final String title;
  final String subTitle;
  final Function()? onTap;
  final Color? colorBG;
  final Color? colorText;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 60,

          decoration: BoxDecoration(
            color: colorBG,
            borderRadius: BorderRadius.circular(10),
            boxShadow: kElevationToShadow[2],
          ),
          alignment: Alignment.center,
          constraints: BoxConstraints(maxHeight: 90),
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(
                color: colorText,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              subTitle,
              style: TextStyle(
                color: colorText,
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
            trailing: icon != null ? Icon(Icons.person) : null,
          ),
        ),
      ),
    );
  }
}
