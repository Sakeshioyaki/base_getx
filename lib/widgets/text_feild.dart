import 'package:flutter/material.dart';

class TextFieldCommon extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Function()? onTap;
  final bool? autofocus;
  const TextFieldCommon({
    super.key,
    this.controller,
    this.hintText,
    this.hintStyle,
    this.validator,
    this.prefixIcon,
    this.onTap,
    this.autofocus,
  });

  @override
  Widget build(BuildContext context) {
    final theme =  Theme.of(context);
    return TextField(
      controller: controller,
      autofocus: autofocus ?? false,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        hintText: hintText,
        hintStyle: hintStyle,
        prefixIcon: prefixIcon,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          fillColor: theme.colorScheme.onBackground
          filled: true,
      ),
      onTap: onTap,
    );
  }
}
