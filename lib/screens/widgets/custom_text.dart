import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final TextStyle? textStyle;
  final bool isItalic;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSize;
  final int? maxLines;
  final TextAlign? textAlign;

  const CustomText(
      {required this.text,
      this.textStyle,
      this.isItalic = false,
      this.fontWeight,
      this.color,
      this.fontSize,
      this.maxLines,
      this.textAlign = TextAlign.center,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: (textStyle ?? Theme.of(context).textTheme.bodyMedium)!.copyWith(
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
          fontWeight: fontWeight,
          fontFamily: "Matter",
          fontSize: fontSize,
          color: color),
    );
  }
}
