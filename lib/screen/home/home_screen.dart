import 'package:company_project/layer_data/profile_data.dart';
import 'package:company_project/screen/home/cubit/home_cubit.dart';
import 'package:company_project/screen/settings/display_settings.dart';
import 'package:company_project/screen/widgets/buttons/action_button_custom.dart';
import 'package:company_project/screen/widgets/cards/card_info_company.dart';
import 'package:company_project/utils/color_style.dart';
import 'package:company_project/screen/widgets/cards/card_display.dart';
import 'package:company_project/screen/widgets/images/images_account.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Builder(
        builder: (context) {
          final cubit = context.read<HomeCubit>();
          cubit.getProfile();
          return Scaffold(
            backgroundColor: Color(0xffF5F5F5),
            body: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return Center(
                    child: CircularProgressIndicator(color: ColorStyle.primary),
                  );
                }
                final getIt = GetIt.I.get<ProfileData>().profile;

                return Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ImageAccount(url: getIt?.logoUrl),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  getIt?.companyName ?? '----',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  getIt!.id,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),

                            Spacer(),
                            Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                onPressed: () {
                                  cubit.refresh();
                                },
                                icon: Icon(Icons.refresh),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                displaySettings(context: context);
                              },
                              icon: Icon(Icons.settings),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: ColorStyle.primary),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Company Information:",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Wrap(
                                children: [
                                  CardInfoCompany(
                                    title: 'Phone',
                                    value: getIt.mobile ?? "----",
                                  ),
                                  CardInfoCompany(
                                    title: 'Email',
                                    value: getIt.email ?? "----",
                                  ),
                                  CardInfoCompany(
                                    title: 'Commercial Register',
                                    value: getIt.commercialId ?? "----",
                                  ),
                                  CardInfoCompany(
                                    title: 'Establishment Number',
                                    value: getIt.establishmentId ?? "----",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 36),

                        Center(
                          child: Wrap(
                            spacing: 25,
                            runSpacing: 20,
                            children: [
                              CardDisplay(
                                title: "Orders",
                                subTitle: "Total Orders",
                                titleValue: getIt.analyzes?.orders ?? 0,
                              ),
                              CardDisplay(
                                title: "Drivers",
                                subTitle: "Total Drivers",
                                titleValue: getIt.analyzes?.drivers ?? 0,
                              ),
                              CardDisplay(
                                title: "RS",
                                subTitle: "Total profit",
                                titleValue: getIt.analyzes?.profit ?? 0,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 25),
                        ActionButtonCustom(
                          title: 'Drivers',
                          onTap: () async {
                            // context.pushScreen(
                            //   screen: DriversScreen(),
                            //   canPop: true,
                            // );
                            context.goNamed('/drivers');
                          },
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
    );
  }
}
