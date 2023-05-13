import 'package:elredtodo/utils/app_colors.dart';
import 'package:elredtodo/utils/app_sizing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class AuthScreenHeader extends StatelessWidget {
  const AuthScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.ht(0.45),
      width: double.infinity,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
          color: AppColors.pageBG,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(
                context.wd(0.35),
              ),
              bottomRight: Radius.circular(
                context.wd(0.35),
              ))),
      child: Transform.translate(
        offset: Offset(0, context.ht(0.05)),
        child: Container(
          height: 100,
          width: 100,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[200]!,
                    blurRadius: 3,
                    spreadRadius: 0,
                    offset: const Offset(0, 6))
              ]),
          child: Image.asset(
            "assets/images/elRed_logo.png",
          ),
        ),
      ),
    );
  }
}
