import 'dart:typed_data';
import 'package:company_project/screen/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:company_project/screen/widgets/dialogs/loading_dialog.dart';
import 'package:company_project/screen/widgets/textfields/text_field_custom.dart';
import 'package:company_project/utils/methods/upload_xlsx_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Uint8List? image;
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
                  final sizeImage = constrained.maxWidth;
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
                          // context.pushScreen(
                          //   screen: HomeScreen(),
                          //   canPop: false,
                          // );
                          context.goNamed('/home');
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

                                    width: sizeImage / 2,
                                    height: sizeImage / 2,
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
                                  // context.pushScreen(
                                  //   screen: CheckScreen(),
                                  //   canPop: false,
                                  // );
                                  context.goNamed("/");
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
