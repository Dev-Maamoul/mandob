import 'package:company_project/models/driver_model.dart';
import 'package:company_project/screen/drivers/drivers_screen.dart';
import 'package:company_project/screen/test.dart';
import 'package:company_project/screen/widgets/card_display.dart';
import 'package:company_project/screen/widgets/images/images_account.dart.dart';
import 'package:company_project/utils/color_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DriversViewScreen extends StatelessWidget {
  const DriversViewScreen({super.key, required this.driver});
  final DriverModel driver;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [CardDriverInfo(driver: driver)],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuCustom extends StatelessWidget {
  const MenuCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return const MenuCustom();
  }
}
