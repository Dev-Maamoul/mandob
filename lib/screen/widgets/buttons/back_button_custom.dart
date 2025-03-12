import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BackButtonCustom extends StatelessWidget {
  const BackButtonCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // if (Navigator.canPop(context)) {
        //   Navigator.pop(context);
        // }
        context.pop(context);
      },
      child: Text("<-Back"),
    );
  }
}
