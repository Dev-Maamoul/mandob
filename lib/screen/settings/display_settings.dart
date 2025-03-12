import 'package:company_project/layer_data/init_class.dart';
import 'package:company_project/screen/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

displaySettings({required BuildContext context}) {
  List<Widget> widget = [
    Settings(
      title: "EditProfile",
      subTitle: "Edit or View Profile",
      onTap: () {
        // context.pushScreen(screen: EditProfileScreen());
        context.goNamed('/edit_profile');
      },
    ),

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
          // context.pushScreen(screen: CheckScreen());
          context.goNamed('/');
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
                // Navigator.pop(context); // Close dialog
                context.pop(context); // Close dialog
              },
              child: Text('Close'),
            ),
          ],
        ),
  );
}
