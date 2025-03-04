import 'package:flutter/material.dart';

extension NavigatorView on BuildContext {
  pushScreen({required Widget screen, bool canPop = false}) {
    return Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(builder: (context) => screen),
      (route) => canPop,
    );
  }
}