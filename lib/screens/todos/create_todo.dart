import 'package:elredtodo/providers/todo_provider.dart';
import 'package:elredtodo/screens/widgets/custom_button.dart';
import 'package:elredtodo/screens/widgets/custom_date_picker.dart';
import 'package:elredtodo/screens/widgets/custom_input.dart';
import 'package:elredtodo/screens/widgets/custom_text.dart';
import 'package:elredtodo/utils/app_colors.dart';
import 'package:elredtodo/utils/app_sizing.dart';
import 'package:elredtodo/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

class CreateTodo extends StatelessWidget {
  const CreateTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBG,
      appBar: AppBar(
          backgroundColor: AppColors.pageBG,
          elevation: 0,
          centerTitle: true,
          title: Consumer<TodoProvider>(
            builder: (context, todoController, child) {
              bool isEdit = todoController.editableId.isNotEmpty;
              return CustomText(
                text: isEdit ? "Edit task" : "Add new task",
                color: Colors.white,
                fontSize: 16,
              );
            },
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 140,
                width: double.infinity,
                child: RiveAnimation.asset(
                  "assets/rives/create_task.riv",
                ),
              ),
              Consumer<TodoProvider>(
                builder: (context, todoController, child) {
                  return InputWidget(
                    helperText: todoController.nameErr,
                    controller: todoController.name,
                    placeHolder: "Task name",
                  );
                },
              ),
              AppSizes.heightBox(20),
              Consumer<TodoProvider>(
                builder: (context, todoController, child) {
                  return InputWidget(
                    controller: todoController.desc,
                    placeHolder: "Task description",
                    maxLines: 5,
                  );
                },
              ),
              AppSizes.heightBox(20),
              Consumer<TodoProvider>(
                builder: (context, todoController, child) {
                  return CustomDatePicker(
                      callback: () async {
                        todoController.pickCompletionDate(context);
                      },
                      value: todoController.completionDate.formatDate(),
                      placeholder: "Expected completion date");
                },
              ),
              AppSizes.heightBox(20),
              Consumer<TodoProvider>(
                builder: (context, todoController, child) {
                  bool isEdit = todoController.editableId.isNotEmpty;

                  return CustomButton(
                    onTap: () {
                      todoController.validateInputs();
                    },
                    label: isEdit ? "Update task" : "Add task",
                    isLoading: todoController.isLoading,
                    width: double.infinity,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
