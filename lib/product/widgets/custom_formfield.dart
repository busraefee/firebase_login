import 'package:firebase_login/product/components/app_color.dart';
import 'package:firebase_login/product/components/app_string.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField(
      {Key? key,
      required this.controller,
      required this.inputType,
      required this.name,
      this.obscureText})
      : super(key: key);
  final TextEditingController controller;
  final TextInputType inputType;
  final String name;
  final bool? obscureText;

  @override
  _CustomFormFieldState createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.inputType,
      obscureText: widget.obscureText ?? false,
      decoration: InputDecoration(
        labelText: widget.name,
        labelStyle: const TextStyle(color: AppColor.loginText),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: BorderSide(color: AppColor.loginFormField, width: 2)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: BorderSide(
              width: 3,
              color: AppColor.loginFormField,
            )),
      ),
    );
  }
}
