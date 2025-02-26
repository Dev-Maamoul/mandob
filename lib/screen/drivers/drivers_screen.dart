import 'package:company_project/screen/driver_view/drivers_view_screen.dart';
import 'package:company_project/screen/drivers/cubit/drivers_cubit.dart';
import 'package:company_project/screen/login/login_screen.dart';
import 'package:company_project/screen/test.dart';
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
                                    CustomButtonAction(
                                      title: 'Upload New driver sheet',
                                      onTap: () async {
                                        final fileUpload = await uploadXlsxFile(
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
                                            (driver) => PhoneWidgetDriver(
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

class LabelTitleDriverWidget extends StatelessWidget {
  const LabelTitleDriverWidget({super.key, required this.title, this.text});
  final String title;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: (1),
            child: Text(
              "$title:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              text.toString(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

//

class BackButtonCustom extends StatelessWidget {
  const BackButtonCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      },
      child: Text("<-Back"),
    );
  }
}

//

void showSuccessDialog({
  required BuildContext context,
  required bool isDone,
  String? message,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        title: Column(
          children: [
            Icon(
              isDone ? Icons.check_circle : Icons.warning,
              color: isDone ? Colors.green : Colors.red,
              size: 50,
            ),
            SizedBox(height: 10),
            Text(
              isDone ? "Successful" : "Oh there Error",
              textAlign: TextAlign.center,
            ),
          ],
        ),
        content: Text(
          isDone
              ? "All drivers has been successfully added."
              : "Sorry, $message",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isDone ? Colors.green : Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text("OK", style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      );
    },
  );
}

//----
OverlayEntry? _overlayEntry;

OverlayEntry _createOverlayEntry() {
  return OverlayEntry(
    builder:
        (context) => Material(
          child: Center(
            child: CircularProgressIndicator(color: ColorStyle.primary),
          ),
        ),
  );
}

/// عرض AlertDialog
void showDialogLoading({required BuildContext context}) {
  if (_overlayEntry == null) {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }
}

/// إغلاق AlertDialog
void hideDialogLoading() {
  if (_overlayEntry != null) {
    _overlayEntry!.remove();
    _overlayEntry = null;
  }
}

//

class CustomButtonAction extends StatelessWidget {
  const CustomButtonAction({super.key, required this.title, this.onTap});
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
