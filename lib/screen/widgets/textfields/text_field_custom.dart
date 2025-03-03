import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({super.key, required this.title, this.controller});
  final String title;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        constraints: BoxConstraints(maxWidth: 400),
        labelText: title,
        hintText: "Enter $title",
      ),
    );
  }
}