import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final InputBorder? border;
  final String? hintText;
  final EdgeInsetsGeometry? contentPadding;
  final bool obscureText;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool? isDense;
  final Widget? prefixIcon;
  final TextStyle? prefixStyle;
  final bool readOnly;
  final void Function()? onTap;
  final InputBorder? errorBorder;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? disabledBorder;
  final int? maxLines;
  final String? prefixText;
  final TextStyle? style;
  final int? maxLength;
  final AutovalidateMode? autovalidateMode;
  const CustomTextField({
    Key? key,
    this.controller,
    this.border,
    this.hintText,
    this.contentPadding,
    this.obscureText = false,
    this.suffixIcon,
    this.onChanged,
    this.keyboardType,
    this.validator,
    this.inputFormatters,
    this.isDense,
    this.prefixIcon,
    this.prefixStyle,
    this.readOnly = false,
    this.onTap,
    this.enabledBorder,
    this.errorBorder,
    this.disabledBorder,
    this.focusedBorder,
    this.maxLines = 1,
    this.prefixText,
    this.style,
    this.maxLength,
    this.autovalidateMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidateMode,
      maxLength: maxLength,
      style: style,
      onTap: onTap,
      readOnly: readOnly,
      keyboardType: keyboardType,
      maxLines: maxLines,
      inputFormatters: inputFormatters,
      validator: validator,
      onChanged: onChanged,
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        prefixText: prefixText,
        errorBorder: errorBorder,
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        disabledBorder: disabledBorder,
        prefixIcon: prefixIcon,
        isDense: isDense,
        border: border,
        hintText: hintText,
        contentPadding: contentPadding,
        suffixIcon: suffixIcon,
        prefixStyle: prefixStyle,
      ),
    );
  }
}
