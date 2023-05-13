import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'custom_text.dart';

class CustomError extends StatelessWidget {
  final double height;
  const CustomError({this.height = 200, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: const Center(child: CustomText(text: "Something went wrong !")),
    );
  }
}
