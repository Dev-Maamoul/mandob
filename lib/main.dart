import 'package:company_project/screen/checkScreen/check_screen.dart';
import 'package:company_project/screen/driver_view/drivers_view_screen.dart';
import 'package:company_project/screen/test.dart';
import 'package:company_project/services/setup.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: CheckScreen(),
      // home: DriversViewScreen(),
    );
  }
}
