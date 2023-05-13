import 'package:flutter/material.dart';
import '../../utils/app_sizing.dart';
import 'custom_text.dart';

class CustomLoader extends StatelessWidget {
  final double? height;
  final String? customText;
  final Color? loaderColor;
  final double? loaderWidth;

  const CustomLoader(
      {this.customText,
      this.height,
      this.loaderColor,
      this.loaderWidth = 20.0,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: loaderWidth,
                width: loaderWidth,
                child: CircularProgressIndicator(
                  color: loaderColor,
                  strokeWidth: 2,
                )),
            AppSizes.widthBox(10),
            CustomText(
              text: customText ?? "Loading..",
              color: loaderColor,
            )
          ],
        ),
      ),
    );
  }
}
