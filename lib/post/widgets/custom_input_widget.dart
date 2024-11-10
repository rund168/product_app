import 'package:flutter/material.dart';

class CustomInputWidget extends StatelessWidget {
  TextEditingController controller;
  String? hintText, labelText;
  Icon? prefixIcon, suffixIcon;
  CustomInputWidget({
    super.key,
    required this.controller,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hintText?? "",
          labelText: labelText?? "",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
