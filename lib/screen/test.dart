import 'dart:convert';
import 'dart:io';
import 'dart:io';
import 'dart:typed_data';
import 'package:company_project/models/driver_model.dart';
import 'package:company_project/screen/widgets/images/images_account.dart.dart';
import 'package:company_project/utils/color_style.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:universal_html/html.dart' as html;
import 'package:http/http.dart' as http;

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

//

class PhoneWidgetDriver extends StatelessWidget {
  const PhoneWidgetDriver({super.key, required this.driver, this.onPressed});
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
          Expanded(
            flex: 2,
            child: Center(child: ImageAccount(url: driver.imageUrl, size: 80)),
          ),
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
