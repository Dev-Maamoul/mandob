import 'package:company_project/extenstions/navigator_view.dart';
import 'package:company_project/screen/driver_view/drivers_view_screen.dart';
import 'package:company_project/screen/drivers/cubit/drivers_cubit.dart';
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
