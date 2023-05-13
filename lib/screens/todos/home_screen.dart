import 'package:elredtodo/providers/todo_provider.dart';
import 'package:elredtodo/repos/todo_repo.dart';
import 'package:elredtodo/routes/app_routes.dart';
import 'package:elredtodo/screens/todos/widgets/home_screen_header.dart';
import 'package:elredtodo/screens/todos/widgets/todo_list.dart';
import 'package:elredtodo/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../utils/app_sizing.dart';
import '../widgets/custom_loader.dart';
import '../widgets/custom_text.dart';
import '../widgets/error_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<TodoProvider>(context, listen: false).clearInputs();
          Get.toNamed(AppRoutes.createTodo);
        },
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeScreenHeader(),
            StreamBuilder(
                stream: TodoRepo().getAllUserTodos(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CustomLoader(
                      height: 200,
                    );
                  }
                  if (snapshot.hasError) {
                    return const CustomError();
                  }
                  if (!snapshot.hasData) {
                    return const SizedBox(
                      height: 200,
                      child: Center(child: CustomText(text: "No data")),
                    );
                  }
                  if (snapshot.data!.docs.isEmpty) {
                    return SizedBox(
                      height: 250,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/no_tasks.jpg",
                            height: 100,
                          ),
                          AppSizes.heightBox(15),
                          const CustomText(
                            text: "No tasks on the horizon !",
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                          AppSizes.heightBox(6),
                          const CustomText(text: "Add tasks for your day")
                        ],
                      )),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: const [
                        TodoList(
                          status: "Pending",
                        ),
                        TodoList(
                          status: "Completed",
                        ),
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
