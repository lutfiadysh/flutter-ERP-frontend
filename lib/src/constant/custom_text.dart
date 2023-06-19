import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    @required this.title,
    this.fontSize,
    this.textAlign,
    this.textColor,
    this.fontWeight,
    this.maxLine,
    this.overflow,
    this.textDecoration,
  })  : assert(title != null),
        super(key: key);
  final String? title;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLine;
  final TextOverflow? overflow;
  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      textAlign: textAlign,
      maxLines: maxLine,
      overflow: overflow,
      style: TextStyle(
          fontSize: fontSize,
          color: textColor,
          fontWeight: fontWeight,
          decoration: textDecoration),
    );
  }
}
