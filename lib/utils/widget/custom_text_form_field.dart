import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.validator,
    required this.label,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.keyboardType,
    this.controller,
    this.readOnly = false,
    this.onTap,
    this.autovalidateMode,
    this.initialValue,
    this.minLines,
    this.maxLines,
    this.textInputAction,
    // this.onSaved
  });

  final String? Function(String?)? validator;
  final String label;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool? readOnly;
  final void Function()? onTap;
  final AutovalidateMode? autovalidateMode;
  final String? initialValue;
  final int? minLines;
  int? maxLines = 1;
  TextInputAction? textInputAction;

  // final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      obscuringCharacter: "*",
      initialValue: initialValue,
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      autovalidateMode: autovalidateMode,
      minLines: minLines,
      maxLines: maxLines,
      onTap: onTap,
      // onSaved: onSaved,
      readOnly: readOnly ?? false,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        label: Text(label),
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
