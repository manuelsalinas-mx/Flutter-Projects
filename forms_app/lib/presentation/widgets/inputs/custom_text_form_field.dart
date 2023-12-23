import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final IconData? leftIcon;
  final bool isObscure;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    this.label,
    this.hint,
    this.leftIcon,
    this.isObscure = false,
    this.errorMessage,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      // borderSide: BorderSide(color: colors.primary)
    );

    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: isObscure,
      decoration: InputDecoration(
          enabledBorder: border,
          focusedBorder:
              border.copyWith(borderSide: BorderSide(color: colors.primary)),
          errorBorder: border.copyWith(
              borderSide: BorderSide(color: Colors.red.shade800)),
          focusedErrorBorder: border.copyWith(
              borderSide: BorderSide(color: Colors.red.shade400)),
          isDense: true,
          label: (label == null) ? null : Text(label!),
          hintText: hint,
          prefixIcon:
              (leftIcon == null) ? null : Icon(leftIcon, color: colors.primary),
          errorText: errorMessage),
    );
  }
}
