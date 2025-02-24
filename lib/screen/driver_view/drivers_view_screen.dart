import 'package:company_project/models/driver_model.dart';
import 'package:company_project/screen/drivers/drivers_screen.dart';
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
          child: Container(
            height: 600,
            width: 400,
            padding: EdgeInsets.all(16),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: kElevationToShadow[1],
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ID Driver:",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            driver.id!,
                            style: TextStyle(
                              color: ColorStyle.primary,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Create Driver:",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            driver.registrationDate!,
                            style: TextStyle(
                              color: ColorStyle.primary,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Center(child: ImageAccount(url: driver.imageUrl)),
                  SizedBox(height: 16),
                  Wrap(
                    runSpacing: 16,
                    children: [
                      Expanded(
                        flex: 6,
                        child: LabelTitleDriverWidget(
                          title: "Full Name",
                          text: driver.fullName,
                          sizeCard: 250,
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: LabelTitleDriverWidget(
                          title: "Mobile",
                          text: driver.mobile,
                          sizeCard: 160,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: LabelTitleDriverWidget(
                          title: "Completed",
                          text: (driver.completed ?? false).toString(),
                          sizeCard: 120,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Wrap(
                    runSpacing: 16,
                    children: [
                      Expanded(
                        flex: 6,
                        child: LabelTitleDriverWidget(
                          title: "BirthDay",
                          text: driver.dateOfBirth,
                          sizeCard: 180,
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: LabelTitleDriverWidget(
                          title: "Nationality",
                          text: driver.nationality,
                          sizeCard: 180,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: LabelTitleDriverWidget(
                          title: "ID Nationality",
                          text: driver.idNumber,
                          sizeCard: 180,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  LabelTitleDriverWidget(
                    title: "Email",
                    text: driver.email,
                    sizeCard: 500,
                  ),
                  SizedBox(height: 16),
                  Wrap(
                    runSpacing: 16,
                    children: [
                      Expanded(
                        flex: 6,
                        child: LabelTitleDriverWidget(
                          title: "Car number",
                          text: driver.carNumber,
                          sizeCard: 180,
                        ),
                      ),
                      Expanded(
                        flex: 9,
                        child: LabelTitleDriverWidget(
                          title: "Vehicle number",
                          text: driver.vehicleSequenceNumber,
                          sizeCard: 180,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Wrap(
                    runSpacing: 16,
                    children: [
                      Expanded(
                        flex: 6,
                        child: LabelTitleDriverWidget(
                          title: "City",
                          text: driver.staticCities?.cityEn,
                          sizeCard: 180,
                        ),
                      ),
                      Expanded(
                        flex: 9,
                        child: LabelTitleDriverWidget(
                          title: "Region",
                          text: driver.staticCities?.regionEn,
                          sizeCard: 180,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Wrap(
                    children: [
                      CardDisplay(
                        size: 150,
                        title: "RS",
                        subTitle: "Total profit",
                        titleValue: driver.profits ?? 0,
                      ),
                      CardDisplay(
                        size: 150,
                        title: "orders",
                        subTitle: "Total orders",
                        titleValue: driver.countOrders ?? 0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
