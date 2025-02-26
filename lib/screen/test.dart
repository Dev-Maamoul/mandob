import 'package:company_project/models/driver_model.dart';
import 'package:company_project/screen/drivers/drivers_screen.dart';
import 'package:company_project/screen/widgets/card_display.dart';
import 'package:company_project/screen/widgets/images/images_account.dart.dart';
import 'package:company_project/utils/color_style.dart';
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

//----

class CardDriverInfo extends StatelessWidget {
  const CardDriverInfo({super.key, required this.driver});
  final DriverModel driver;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: constraints.maxHeight,
          constraints: BoxConstraints(maxHeight: 600, minHeight: 500),
          width: 350,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: ColorStyle.primary),
            borderRadius: BorderRadius.circular(16),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LabelColumn(title: "ID driver", value: driver.id!),
                    LabelColumn(
                      title: 'create at',
                      value: driver.registrationDate.toString(),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Center(
                      child: ImageAccount(
                        size: constraints.maxWidth > 500 ? 100 : 300,
                      ),
                    ),
                    Column(
                      children: [
                        LabelTitleDriverWidget(
                          title: "Full Name",
                          text: driver.fullName,
                        ),
                        LabelTitleDriverWidget(
                          title: "Mobile",
                          text: driver.mobile,
                        ),
                        LabelTitleDriverWidget(
                          title: "Email",
                          text: driver.email.toString(),
                        ),
                        LabelTitleDriverWidget(
                          title: "National ID",
                          text: driver.idNumber,
                        ),
                        LabelTitleDriverWidget(
                          title: "Nationality",
                          text: driver.nationality,
                        ),
                        LabelTitleDriverWidget(
                          title: "Birth Day",
                          text: driver.dateOfBirth,
                        ),
                        LabelTitleDriverWidget(
                          title: "Car",
                          text: driver.carNumber,
                        ),
                        LabelTitleDriverWidget(
                          title: "Vehicle ID",
                          text: driver.vehicleSequenceNumber,
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CardDisplay(
                          size: constraints.maxWidth > 500 ? 150 : 150,
                          title: "orders",
                          subTitle: "Total orders",
                          titleValue: driver.countOrders ?? 0,
                        ),
                        CardDisplay(
                          size: constraints.maxWidth > 500 ? 150 : 150,
                          title: "RS",
                          subTitle: "Total profit",
                          titleValue: driver.profits ?? 0,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

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
