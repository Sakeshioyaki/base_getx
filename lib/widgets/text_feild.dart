import 'package:base_getx/commons/enums/app_constants.dart';
import 'package:flutter/material.dart';

class TextFieldCommon extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Function()? onTap;
  final bool? autofocus;
  final Color? background;
  final InputDecoration? border;

  const TextFieldCommon({
    super.key,
    this.controller,
    this.hintText,
    this.hintStyle,
    this.validator,
    this.prefixIcon,
    this.onTap,
    this.autofocus,
    this.background,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      controller: controller,
      autofocus: autofocus ?? false,
      decoration: border ??
          InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide.none,
            ),
            hintText: hintText,
            hintStyle: hintStyle ??
                const TextStyle(fontFamily: AppConstants.fontK2D, fontSize: 18),
            prefixIcon: prefixIcon,
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            fillColor: background,
            filled: background != null ? true : false,
          ),
      onTap: onTap,
    );
  }
}
