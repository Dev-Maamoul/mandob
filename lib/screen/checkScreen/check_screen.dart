import 'package:company_project/layer_data/init_class.dart';
import 'package:company_project/utils/color_style.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class CheckScreen extends StatelessWidget {
  const CheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () async {
      final getIt = GetIt.I.get<InitClass>();
      await getIt.loadData();
      if (getIt.authData?.token != null) {
        // context.pushScreen(screen: HomeScreen());
        context.goNamed('/home');
      } else {
        // context.pushScreen(screen: LoginScreen());
        context.goNamed('/login');
      }
    });
    return Scaffold(
      body: Center(child: CircularProgressIndicator(color: ColorStyle.primary)),
    );
  }
}
