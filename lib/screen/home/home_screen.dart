import 'package:company_project/layer_data/InitClass.dart';
import 'package:company_project/layer_data/profile_data.dart';
import 'package:company_project/screen/checkScreen/check_screen.dart';
import 'package:company_project/screen/drivers/drivers_screen.dart';
import 'package:company_project/screen/home/cubit/home_cubit.dart';
import 'package:company_project/screen/login/login_screen.dart';
import 'package:company_project/utils/color_style.dart';
import 'package:company_project/screen/widgets/buttons/Card_button.dart';
import 'package:company_project/screen/widgets/cardInfo_company.dart';
import 'package:company_project/screen/widgets/card_display.dart';
import 'package:company_project/screen/widgets/images/images_account.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

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
                                titleValue: getIt?.analyzes?.orders ?? 0,
                              ),
                              CardDisplay(
                                title: "Drivers",
                                subTitle: "Total Drivers",
                                titleValue: getIt?.analyzes?.drivers ?? 0,
                              ),
                              CardDisplay(
                                title: "RS",
                                subTitle: "Total profit",
                                titleValue: getIt?.analyzes?.profit ?? 0,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 25),
                        Center(
                          child: Wrap(
                            spacing: 25,
                            runSpacing: 20,
                            children: [
                              CardButton(
                                title: "Drivers",
                                onTap: () async {
                                  context.pushScreen(
                                    screen: DriversScreen(),
                                    canPop: true,
                                  );
                                },
                              ),
                            ],
                          ),
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

//---

//--

class Settings extends StatelessWidget {
  const Settings({
    super.key,
    required this.title,
    required this.subTitle,
    this.onTap,
    this.colorBG = Colors.white,
    this.colorText = Colors.black,
    this.icon,
  });
  final String title;
  final String subTitle;
  final Function()? onTap;
  final Color? colorBG;
  final Color? colorText;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 60,

          decoration: BoxDecoration(
            color: colorBG,
            borderRadius: BorderRadius.circular(10),
            boxShadow: kElevationToShadow[2],
          ),
          alignment: Alignment.center,
          constraints: BoxConstraints(maxHeight: 90),
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(
                color: colorText,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              subTitle,
              style: TextStyle(
                color: colorText,
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
            trailing: icon != null ? Icon(Icons.person) : null,
          ),
        ),
      ),
    );
  }
}

//--
displaySettings({required BuildContext context}) {
  List<Widget> widget = [
    Settings(title: "Profile", subTitle: "Edit or View Profile", onTap: () {}),

    Settings(
      title: "Logout",
      subTitle: "For log out your account",
      colorBG: Colors.red,
      colorText: Colors.white,

      onTap: () async {
        final getIt = GetIt.I.get<InitClass>();
        await getIt.clearData();
        await getIt.loadData();
        if (context.mounted) {
          context.pushScreen(screen: CheckScreen());
        }
      },
    ),
  ];
  showDialog(
    context: context,
    useSafeArea: true,
    useRootNavigator: true,
    builder:
        (context) => AlertDialog(
          title: Text('Settings'),
          content: SizedBox(
            height: widget.length * 68,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                spacing: 8,
                children: widget,
              ),
            ),
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
              },
              child: Text('Close'),
            ),
          ],
        ),
  );
}
