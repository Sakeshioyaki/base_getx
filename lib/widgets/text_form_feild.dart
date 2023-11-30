import 'package:base_getx/commons/enums/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldCommon extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool obscureText;

  const TextFieldCommon({
    super.key,
    this.controller,
    this.hintText,
    this.hintStyle,
    this.validator,
    this.suffixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      // autofocus: true,
      decoration: InputDecoration(
        hintText: hintText?.tr,
        hintStyle: hintStyle,
        suffixIcon: suffixIcon,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Color(0xC1978F8F),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Color(0xFFE6CECE)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Color(0xC1978F8F),
          ),
        ),
        errorStyle: const TextStyle(
          color: Colors.red,
          fontFamily: AppConstants.fontK2D,
        ),
      ),
    );
  }
}
