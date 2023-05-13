import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import 'custom_text.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String placeHolder;

  final Widget? prefixWid;
  final Widget? suffixWid;
  final TextInputType? inputType;
  final bool obscure;
  final String helperText;
  final bool readOnly;
  final void Function()? onTap;
  final int? maxLines;

  const InputWidget(
      {this.label = "",
      required this.controller,
      this.prefixWid,
      this.suffixWid,
      this.inputType,
      this.onTap,
      this.maxLines,
      this.placeHolder = "",
      this.obscure = false,
      this.readOnly = false,
      this.helperText = "",
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label.isEmpty ? Container() : CustomText(text: label),
        TextFormField(
          readOnly: readOnly,
          obscureText: obscure,
          maxLines: maxLines,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontSize: 16, color: Colors.white),
          onTap: onTap,
          keyboardType: inputType,
          controller: controller,
          decoration: InputDecoration(
              focusColor: AppColors.greyColor,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      strokeAlign: 0,
                      width: 0.5,
                      color: helperText.isNotEmpty
                          ? Colors.red.withOpacity(0.7)
                          : AppColors.greyColor)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 0.5,
                      strokeAlign: 0,
                      color: helperText.isNotEmpty
                          ? Colors.red.withOpacity(0.7)
                          : AppColors.greyColor)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 0.5,
                      strokeAlign: 0,
                      color: helperText.isNotEmpty
                          ? Colors.red.withOpacity(0.7)
                          : AppColors.greyColor)),
              helperText: helperText.isEmpty ? null : helperText,
              helperStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Colors.red,
                  ),
              suffixIconColor: Colors.grey[400]!,
              labelText: placeHolder,
              labelStyle: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontSize: 16, color: Colors.grey),
              prefixIcon: prefixWid,
              suffixIcon: suffixWid),
        )
      ],
    );
  }
}
