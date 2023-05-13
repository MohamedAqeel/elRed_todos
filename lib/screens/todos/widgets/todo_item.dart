import 'package:elredtodo/providers/todo_provider.dart';
import 'package:elredtodo/repos/models/todo_model.dart';
import 'package:elredtodo/screens/widgets/custom_button.dart';
import 'package:elredtodo/screens/widgets/custom_text.dart';
import 'package:elredtodo/utils/app_colors.dart';
import 'package:elredtodo/utils/app_sizing.dart';
import 'package:elredtodo/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoItem extends StatelessWidget {
  final TodoModel todoModel;
  const TodoItem({required this.todoModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: Colors.grey[200]!))),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: todoModel.name,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                AppSizes.heightBox(6),
                CustomText(
                  text: todoModel.desc.isEmpty ? "N/A" : todoModel.desc,
                  color: Colors.grey,
                  fontSize: 14,
                  maxLines: 3,
                  textAlign: TextAlign.start,
                ),
                AppSizes.heightBox(6),
                CustomText(
                  text: todoModel.completion_ts.formatDate(),
                  fontSize: 12,
                  isItalic: true,
                ),
              ],
            ),
          ),
          Row(
            children: [
              AppSizes.widthBox(8),
              todoModel.completed
                  ? Container()
                  : SizedBox(
                      height: 30,
                      width: 30,
                      child: FloatingActionButton(
                        heroTag: "btn1 ${todoModel.id}",
                        backgroundColor: AppColors.primaryColor,
                        onPressed: () {
                          Provider.of<TodoProvider>(context, listen: false)
                              .prefill(todoModel);
                        },
                        child: const Icon(
                          Icons.edit,
                          size: 18,
                        ),
                      ),
                    ),
              AppSizes.widthBox(8),
              SizedBox(
                height: 30,
                width: 30,
                child: FloatingActionButton(
                  heroTag: "btn2 ${todoModel.id}",
                  backgroundColor: Colors.red.shade300,
                  onPressed: () {
                    Provider.of<TodoProvider>(context, listen: false)
                        .deleteTask(context, todoModel);
                  },
                  child: const Icon(
                    Icons.delete,
                    size: 18,
                  ),
                ),
              ),
              AppSizes.widthBox(8),
              todoModel.completed
                  ? Container()
                  : SizedBox(
                      height: 30,
                      width: 30,
                      child: FloatingActionButton(
                        heroTag: "btn3 ${todoModel.id}",
                        backgroundColor: Colors.green,
                        onPressed: () {
                          Provider.of<TodoProvider>(context, listen: false)
                              .markComplete(context, todoModel);
                        },
                        child: const Icon(
                          Icons.done,
                          size: 18,
                        ),
                      ),
                    )
            ],
          )
        ],
      ),
    );
  }
}
