import 'package:company_project/screen/driver_view/drivers_view_screen.dart';
import 'package:company_project/screen/drivers/cubit/drivers_cubit.dart';
import 'package:company_project/screen/login/login_screen.dart';
import 'package:company_project/screen/test.dart';
import 'package:company_project/screen/widgets/buttons/action_button_custom.dart';
import 'package:company_project/screen/widgets/cards/small_card_driver_info.dart';
import 'package:company_project/screen/widgets/dialogs/loading_dialog.dart';
import 'package:company_project/screen/widgets/dialogs/success_dialog.dart';
import 'package:company_project/utils/color_style.dart';
import 'package:company_project/utils/methods/upload_xlsx_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DriversScreen extends StatelessWidget {
  const DriversScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DriversCubit(),
      child: Builder(
        builder: (context) {
          final cubit = context.read<DriversCubit>();
          cubit.loadDrivers();

          return BlocListener<DriversCubit, DriversState>(
            listener: (context, state) {
              if (state is SuccessUploadedState) {
                showSuccessDialog(context: context, isDone: true);
              }
              if (state is LoadingUploadedState) {
                showDialogLoading(context: context);
              } else {
                hideDialogLoading();
              }
              if (state is ErrorUploadedState) {
                showSuccessDialog(
                  context: context,
                  isDone: false,
                  message: "${state.text},${state.text},${state.text},",
                );
              }
            },
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      height: MediaQuery.sizeOf(context).height,
                      width: MediaQuery.sizeOf(context).width,
                      padding: EdgeInsets.only(top: 50),
                      child: BlocBuilder<DriversCubit, DriversState>(
                        builder: (context, state) {
                          if (state is LoadingState) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: ColorStyle.primary,
                              ),
                            );
                          }
                          return SingleChildScrollView(
                            child: Column(
                              children: [
                                Wrap(
                                  alignment:
                                      constraints.maxWidth > 600
                                          ? WrapAlignment.center
                                          : WrapAlignment.start,
                                  runSpacing: 10,
                                  spacing: 10,
                                  children: [
                                    ActionButtonCustom(
                                      title: 'Upload New driver sheet',
                                      onTap: () async {
                                        final fileUpload = await uploadFile(
                                          allowedExtensions: ['xlsx'],
                                        );
                                        await cubit.uploadFile(
                                          fileData: fileUpload,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16),
                                // if (isPhone)
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children:
                                      cubit.getIt.drivers!
                                          .map(
                                            (driver) => SmallCardDriverInfo(
                                              driver: driver,
                                              onPressed: () {
                                                context.pushScreen(
                                                  screen: DriversViewScreen(
                                                    driver: driver,
                                                  ),
                                                  canPop: true,
                                                );
                                              },
                                            ),
                                          )
                                          .toList(),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

final x = [
  {
    "id": "drive-NwNAzFRQB4Md8b",
    "id_number": "1123597513",
    "reference_code": null,
    "full_name": "turki",
    "date_of_birth": null,
    "registration_date": "2025-02-18T16:56:11.524146",
    "mobile": "966550200006",
    "email": null,
    "car_number": "rdn5065",
    "vehicle_sequence_number": "123456789",
    "nationality": "saudi",
    "completed": false,
    "image_url":
        "'https://qyueoxzxneyaljhrqewl.supabase.co/storage/v1/object/public/account/logo.png'::text",
    "static_cities": {},
    "count_orders": 0,
    "profits": 0.0,
    "company": {
      "id": "com-32yCheHm",
      "email": "dfvgb@gasdf.com",
      "mobile": "966501231209",
      "logo_url":
          "https://czvvrvjujfozqilkbeji.supabase.co/storage/v1/object/public/account/com-32yCheHm/com-32yCheHm-2025-02-19T17:03:37.028587.png",
      "company_name": "turki asdf",
    },
    "static_car_type": {},
    "static_identity_type": {},
  },
  {
    "id": "drive-7i6Qb4hhCZReiP",
    "id_number": "1083441111",
    "reference_code": null,
    "full_name": "Fahad",
    "date_of_birth": null,
    "registration_date": "2025-02-19T21:59:54.333663",
    "mobile": "966501231212",
    "email": null,
    "car_number": "123dmm",
    "vehicle_sequence_number": "1234567",
    "nationality": "saudi",
    "completed": false,
    "image_url":
        "'https://qyueoxzxneyaljhrqewl.supabase.co/storage/v1/object/public/account/logo.png'::text",
    "static_cities": {},
    "count_orders": 3,
    "profits": 27.5,
    "company": {
      "id": "com-32yCheHm",
      "email": "dfvgb@gasdf.com",
      "mobile": "966501231209",
      "logo_url":
          "https://czvvrvjujfozqilkbeji.supabase.co/storage/v1/object/public/account/com-32yCheHm/com-32yCheHm-2025-02-19T17:03:37.028587.png",
      "company_name": "turki asdf",
    },
    "static_car_type": {},
    "static_identity_type": {},
  },
  {
    "id": "drive-3CoBeFLrIzGrwP",
    "id_number": "1083441111",
    "reference_code": null,
    "full_name": "Fahad",
    "date_of_birth": null,
    "registration_date": "2025-02-18T16:55:39.290543",
    "mobile": "966581905725",
    "email": null,
    "car_number": "dmm1222",
    "vehicle_sequence_number": "154658243",
    "nationality": "saudi",
    "completed": false,
    "image_url":
        "'https://qyueoxzxneyaljhrqewl.supabase.co/storage/v1/object/public/account/logo.png'::text",
    "static_cities": {},
    "count_orders": 0,
    "profits": 0.0,
    "company": {
      "id": "com-32yCheHm",
      "email": "dfvgb@gasdf.com",
      "mobile": "966501231209",
      "logo_url":
          "https://czvvrvjujfozqilkbeji.supabase.co/storage/v1/object/public/account/com-32yCheHm/com-32yCheHm-2025-02-19T17:03:37.028587.png",
      "company_name": "turki asdf",
    },
    "static_car_type": {},
    "static_identity_type": {},
  },
  {
    "id": "drive-xJ4YmypKuYOZRe",
    "id_number": "1083444444",
    "reference_code": null,
    "full_name": "Slman",
    "date_of_birth": null,
    "registration_date": "2025-02-18T16:55:39.295653",
    "mobile": "966586668029",
    "email": null,
    "car_number": "dmm15555",
    "vehicle_sequence_number": "154658254",
    "nationality": "saudi",
    "completed": false,
    "image_url":
        "'https://qyueoxzxneyaljhrqewl.supabase.co/storage/v1/object/public/account/logo.png'::text",
    "static_cities": {},
    "count_orders": 0,
    "profits": 0.0,
    "company": {
      "id": "com-32yCheHm",
      "email": "dfvgb@gasdf.com",
      "mobile": "966501231209",
      "logo_url":
          "https://czvvrvjujfozqilkbeji.supabase.co/storage/v1/object/public/account/com-32yCheHm/com-32yCheHm-2025-02-19T17:03:37.028587.png",
      "company_name": "turki asdf",
    },
    "static_car_type": {},
    "static_identity_type": {},
  },
  {
    "id": "drive-hBYnfSgpQot7BU",
    "id_number": "1083442222",
    "reference_code": null,
    "full_name": "Ali",
    "date_of_birth": null,
    "registration_date": "2025-02-18T16:55:39.3479",
    "mobile": "966585853908",
    "email": null,
    "car_number": "dmm1233",
    "vehicle_sequence_number": "154658287",
    "nationality": "saudi",
    "completed": false,
    "image_url":
        "'https://qyueoxzxneyaljhrqewl.supabase.co/storage/v1/object/public/account/logo.png'::text",
    "static_cities": {},
    "count_orders": 1,
    "profits": 13.75,
    "company": {
      "id": "com-32yCheHm",
      "email": "dfvgb@gasdf.com",
      "mobile": "966501231209",
      "logo_url":
          "https://czvvrvjujfozqilkbeji.supabase.co/storage/v1/object/public/account/com-32yCheHm/com-32yCheHm-2025-02-19T17:03:37.028587.png",
      "company_name": "turki asdf",
    },
    "static_car_type": {},
    "static_identity_type": {},
  },
];


