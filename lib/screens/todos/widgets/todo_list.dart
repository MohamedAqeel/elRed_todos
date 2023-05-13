import 'dart:developer';

import 'package:elredtodo/repos/models/todo_model.dart';
import 'package:elredtodo/repos/todo_repo.dart';
import 'package:elredtodo/screens/todos/widgets/todo_item.dart';
import 'package:elredtodo/screens/widgets/custom_text.dart';
import 'package:elredtodo/utils/app_colors.dart';
import 'package:elredtodo/utils/app_sizing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../widgets/custom_loader.dart';
import '../../widgets/error_widget.dart';

class TodoList extends StatelessWidget {
  final String status;
  const TodoList({required this.status, super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: TodoRepo().getUserTodos(status),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CustomLoader(
              height: 200,
            );
          }
          if (snapshot.hasError) {
            log(snapshot.error.toString());
            return const CustomError();
          }
          if (!snapshot.hasData) {
            return Container();
          }
          if (snapshot.data!.docs.isEmpty) {
            return Container();
          }
          String count = snapshot.data!.docs.length.toString();
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "$status Tasks ( $count )",
                fontSize: 18,
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
              AppSizes.heightBox(10),
              ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: snapshot.data!.docs.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  TodoModel todoModel = TodoModel.fromJson(
                      snapshot.data!.docs[index].data()
                          as Map<String, dynamic>);
                  return TodoItem(
                    todoModel: todoModel,
                  );
                },
              )
            ],
          );
        });
  }
}
