import 'package:company_project/models/driver_model.dart';
import 'package:company_project/widgets/images/images_account.dart.dart';
import 'package:company_project/widgets/text/label_custom_with_title.dart';
import 'package:company_project/utils/color_style.dart';
import 'package:flutter/material.dart';

class SmallCardDriverInfo extends StatelessWidget {
  const SmallCardDriverInfo({super.key, required this.driver, this.onPressed});
  final DriverModel driver;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 200,
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: ColorStyle.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: ColorStyle.primary, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(child: ImageAccount(url: driver.imageUrl, size: 100)),
          Expanded(
            flex: 3,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  driver.fullName!,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  "#${driver.id}",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
                LabelCustomWithTitle(title: 'Mobile', value: driver.mobile!),
                LabelCustomWithTitle(
                  title: 'Nationality',
                  value: driver.nationality!,
                ),
                LabelCustomWithTitle(
                  title: 'Completed',
                  value: driver.completed.toString(),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: TextButton(
                onPressed: onPressed,
                child: Text(
                  "View",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: ColorStyle.primary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}