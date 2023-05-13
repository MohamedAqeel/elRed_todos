import 'package:elredtodo/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'custom_loader.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String? label;
  final double? width;
  final bool isLoading;
  final bool textButton;
  final bool isCircular;
  final IconData? iconData;
  final void Function()? onTap;
  final double padding;
  final double iconSize;
  final double? circleButtonSize;

  const CustomButton(
      {this.label = "",
      required this.onTap,
      this.width,
      this.iconData,
      this.isCircular = false,
      this.textButton = false,
      this.isLoading = false,
      this.padding = 0.0,
      this.iconSize = 18,
      this.circleButtonSize = 22,
      super.key});

  @override
  Widget build(BuildContext context) {
    if (textButton) {
      return TextButton(onPressed: onTap, child: CustomText(text: label));
    }
    if (isCircular) {
      return SizedBox(
        width: circleButtonSize,
        height: circleButtonSize,
        child: ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(4),
            backgroundColor:
                MaterialStateProperty.all(Theme.of(context).cardColor),
            shadowColor: MaterialStateProperty.all(Colors.black),
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
            padding: MaterialStateProperty.all(EdgeInsets.all(padding)),
          ),
          child: Center(
            child: Icon(
              iconData,
              size: iconSize,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        ),
      );
    }
    return SizedBox(
      // height: 40,
      width: width,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.primaryColor),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          onPressed: isLoading
              ? () {}
              : () {
                  FocusScope.of(context).unfocus();
                  if (onTap != null) {
                    onTap!();
                  }
                },
          child: isLoading
              ? const CustomLoader(
                  loaderColor: Colors.white,
                  loaderWidth: 15,
                )
              : CustomText(
                  text: label,
                  fontWeight: FontWeight.w600,
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                  color: Colors.white,
                ),
        ),
      ),
    );
  }
}
