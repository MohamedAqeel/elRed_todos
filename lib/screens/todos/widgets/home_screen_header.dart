import 'package:elredtodo/repos/todo_repo.dart';
import 'package:elredtodo/screens/widgets/custom_text.dart';
import 'package:elredtodo/utils/app_colors.dart';
import 'package:elredtodo/utils/app_sizing.dart';
import 'package:elredtodo/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/home_bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppSizes.widthBox(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              AppSizes.heightBox(10),
              const CustomText(
                text: "Your\nThings",
                fontSize: 32,
                textAlign: TextAlign.start,
                color: Colors.white,
              ),
              const Spacer(),
              CustomText(
                text: DateTime.now().formatDate(),
                color: AppColors.secondaryText,
              ),
              AppSizes.heightBox(10),
            ],
          ),
          const Spacer(),
          Container(
            height: double.infinity,
            width: context.wd(0.45),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.15),
            ),
            child: Column(
              children: [
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    StreamBuilder(
                        stream: TodoRepo().getUserTodos("Pending"),
                        builder: (context, snapshot) {
                          return countItem(
                              snapshot.hasData
                                  ? snapshot.data!.docs.length.toString()
                                  : "-",
                              "Pending");
                        }),
                    StreamBuilder(
                        stream: TodoRepo().getUserTodos("Completed"),
                        builder: (context, snapshot) {
                          return countItem(
                              snapshot.hasData
                                  ? snapshot.data!.docs.length.toString()
                                  : "-",
                              "Completed");
                        }),
                  ],
                ),
                const Spacer(),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     SizedBox(
                //       width: 15,
                //       height: 15,
                //       child: CircularProgressIndicator(
                //           backgroundColor: Colors.grey[200],
                //           value: 0.6,
                //           strokeWidth: 2,
                //           color: AppColors.primaryColor),
                //     ),
                //     AppSizes.widthBox(10),
                //     CustomText(
                //       text: "60% done",
                //       fontSize: 13,
                //       color: AppColors.secondaryText,
                //     )
                //   ],
                // ),
                AppSizes.heightBox(10)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget countItem(String value, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomText(
          text: value,
          fontSize: 26,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        AppSizes.heightBox(2),
        CustomText(
          text: title,
          fontSize: 11,
          color: AppColors.secondaryText,
        ),
      ],
    );
  }
}
