import 'package:base_getx/commons/enums/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldCommon extends StatelessWidget {
  final String? hintText;
  final TextStyle? hintStyle;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

  const TextFieldCommon({
    super.key,
    this.hintText,
    this.hintStyle,
    this.validator,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
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
