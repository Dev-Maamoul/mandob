import 'package:company_project/models/driver_model.dart';
import 'package:company_project/screen/widgets/cards/card_display.dart';
import 'package:company_project/screen/widgets/images/images_account.dart.dart';
import 'package:company_project/screen/widgets/text/label_column.dart';
import 'package:company_project/screen/widgets/text/label_title_driver_widget.dart';
import 'package:company_project/utils/color_style.dart';
import 'package:flutter/material.dart';

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
