import 'dart:typed_data';

import 'package:company_project/screen/checkScreen/check_screen.dart';
import 'package:company_project/screen/drivers/drivers_screen.dart';
import 'package:company_project/screen/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:company_project/screen/home/home_screen.dart';
import 'package:company_project/screen/login/login_screen.dart';
import 'package:company_project/screen/widgets/dialogs/loading_dialog.dart';
import 'package:company_project/screen/widgets/textfields/text_field_custom.dart';
import 'package:company_project/utils/methods/upload_xlsx_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController controllerName = TextEditingController();

    final TextEditingController controllerCommercialID =
        TextEditingController();

    final TextEditingController controllerEstablishmentID =
        TextEditingController();

    return BlocProvider(
      create: (context) => EditProfileCubit(),
      child: Scaffold(
        body: Builder(
          builder: (context) {
            final cubit = context.read<EditProfileCubit>();
            cubit.loadData();
            controllerName.text = cubit.profile.profile!.companyName ?? '';
            controllerCommercialID.text =
                cubit.profile.profile!.commercialId ?? '';
            controllerEstablishmentID.text =
                cubit.profile.profile!.establishmentId ?? '';
            return SingleChildScrollView(
              child: LayoutBuilder(
                builder: (context, constrained) {
                  final SizeImage = constrained.maxWidth;
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 32,
                      horizontal: 16,
                    ),
                    child: BlocListener<EditProfileCubit, EditProfileState>(
                      listener: (context, state) {
                        if (state is LoadedUpdateStateInit) {
                          showDialogLoading(context: context);
                        } else {
                          hideDialogLoading();
                        }
                        if (state is SuccessChangeImageStateInit) {
                          context.pushScreen(
                            screen: HomeScreen(),
                            canPop: false,
                          );
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          BlocBuilder<EditProfileCubit, EditProfileState>(
                            builder: (context, state) {
                              if (state is! SuccessStateInit &&
                                  state is! SuccessChangeImageStateInit) {
                                return CircularProgressIndicator();
                              }
                              return InkWell(
                                onTap: () async {
                                  final imageLoad = await uploadFile(
                                    allowedExtensions: ['png', 'jpg'],
                                  );
                                  image = Uint8List.fromList(imageLoad);
                                  cubit.changeImage(imageData: image!);
                                },
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxHeight: 200,
                                    maxWidth: 200,
                                  ),
                                  child: Image.memory(
                                    cubit.image!,

                                    width: SizeImage / 2,
                                    height: SizeImage / 2,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              );
                            },
                          ),

                          TextFieldCustom(
                            title: "Company name",
                            controller: controllerName,
                          ),
                          TextFieldCustom(
                            title: "Commercial ID",
                            controller: controllerCommercialID,
                          ),
                          TextFieldCustom(
                            title: "Establishment ID",
                            controller: controllerEstablishmentID,
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  cubit.dataUpdate(
                                    newData: CompanyModel(
                                      fullName: controllerName.text,
                                      commercial: controllerCommercialID.text,
                                      establishmentNumber:
                                          controllerEstablishmentID.text,
                                    ),
                                  );
                                },
                                child: Text("Update"),
                              ),
                              TextButton(
                                onPressed: () {
                                  context.pushScreen(
                                    screen: CheckScreen(),
                                    canPop: false,
                                  );
                                },
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

Uint8List? image;




