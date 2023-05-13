import 'package:elredtodo/providers/auth_provider.dart';
import 'package:elredtodo/routes/app_pages.dart';
import 'package:elredtodo/routes/app_routes.dart';
import 'package:elredtodo/screens/auth/widgets/auth_screen_header.dart';
import 'package:elredtodo/screens/widgets/custom_button.dart';
import 'package:elredtodo/screens/widgets/custom_text.dart';
import 'package:elredtodo/utils/app_colors.dart';
import 'package:elredtodo/utils/app_sizing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_loader.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const AuthScreenHeader(),
        const Spacer(),
        CustomText(
          text: "Be productive !",
          textStyle: Theme.of(context).textTheme.titleLarge,
          fontSize: 24,
        ),
        AppSizes.heightBox(context.ht(0.015)),
        CustomText(
          text: "Manage your tasks\nand productivity",
          textStyle: Theme.of(context).textTheme.bodyMedium,
          fontSize: 14,
        ),
        const Spacer(),
        ElevatedButton.icon(
            onPressed: () {
              Provider.of<AuthProvider>(context, listen: false)
                  .signInWithGoogle();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.pageBG,
              fixedSize: const Size(200, 50),
            ),
            icon: const Icon(Icons.g_mobiledata),
            label: Consumer<AuthProvider>(
              builder: (context, authController, child) {
                if (authController.isLoading) {
                  return const CustomLoader(
                    loaderColor: Colors.white,
                    loaderWidth: 15,
                  );
                }
                return const CustomText(
                  text: "Sign up with google",
                  color: Colors.white,
                );
              },
            )),
        const Spacer(),
      ],
    ));
  }
}
