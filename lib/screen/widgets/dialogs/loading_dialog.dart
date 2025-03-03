import 'package:company_project/utils/color_style.dart';
import 'package:flutter/material.dart';
//----
OverlayEntry? _overlayEntry;

OverlayEntry _createOverlayEntry() {
  return OverlayEntry(
    builder:
        (context) => Material(
          child: Center(
            child: CircularProgressIndicator(color: ColorStyle.primary),
          ),
        ),
  );
}


/// عرض AlertDialog
void showDialogLoading({required BuildContext context}) {
  if (_overlayEntry == null) {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }
}

/// إغلاق AlertDialog
void hideDialogLoading() {
  if (_overlayEntry != null) {
    _overlayEntry!.remove();
    _overlayEntry = null;
  }
}


