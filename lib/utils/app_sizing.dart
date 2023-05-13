import 'package:flutter/material.dart';

class AppSizes {
  static heightBox(double ht) => SizedBox(
        height: ht,
      );
  static widthBox(double wd) => SizedBox(
        width: wd,
      );
}

extension Sizing on BuildContext {
  double ht(double percent) {
    return MediaQuery.of(this).size.height * percent;
  }

  double wd(double percent) {
    return MediaQuery.of(this).size.width * percent;
  }
}
