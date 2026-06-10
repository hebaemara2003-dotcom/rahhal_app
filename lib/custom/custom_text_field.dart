
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
typedef OnChanged = void Function(String)?;
typedef OnValidator = String? Function(String?)?;


class CustomTextFeild extends StatelessWidget {
  bool? filled;
  Color? fillColor;
  Color borderColor;
  Widget? prefixIcon;
  Widget? suffixIcon;
  String? hintText;
  TextStyle? hintStyle;
  int? maxLines;
  TextEditingController? controller;

  OnChanged onChanged;

  OnValidator validator;


  CustomTextFeild({
    super.key, this.filled, this.fillColor,
    required this.borderColor, this.prefixIcon,
    this.suffixIcon, this.hintText,
    this.hintStyle,
    this.maxLines, this.controller,
    this.onChanged, this.validator
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines ?? 1,
      validator: validator,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
        enabledBorder: buildDecorationBorder(
          radius:14,
          borderColor: borderColor,
        ),
        focusedBorder: buildDecorationBorder(
          radius: 14,
          borderColor: borderColor,
        ),
        errorBorder: buildDecorationBorder(
          radius: 14,
          borderColor: AppColors.redColor,
        ),
        focusedErrorBorder: buildDecorationBorder(
          radius: 14,
          borderColor: AppColors.redColor,
        ),
        filled: filled,
        fillColor: fillColor,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: hintStyle,

      ),
    );
  }
}
OutlineInputBorder buildDecorationBorder({
  required double radius,
  required borderColor,
}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius),
    borderSide: BorderSide(color: borderColor, width: 2),
  );
}
