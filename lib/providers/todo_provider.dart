import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elredtodo/repos/auth_repo.dart';
import 'package:elredtodo/repos/models/todo_model.dart';
import 'package:elredtodo/routes/app_pages.dart';
import 'package:elredtodo/routes/app_routes.dart';
import 'package:elredtodo/utils/dialogs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_utils.dart';

class TodoProvider extends ChangeNotifier {
  CollectionReference todoCollection =
      FirebaseFirestore.instance.collection('todos');
  TextEditingController name = TextEditingController();
  TextEditingController desc = TextEditingController();
  String nameErr = "";
  DateTime completionDate = DateTime.now();
  AuthRepository authRepository = AuthRepository();
  String editableId = "";
  bool isLoading = false;

  prefill(TodoModel todoModel) {
    name.text = todoModel.name;
    desc.text = todoModel.desc;
    completionDate = todoModel.completion_ts;
    editableId = todoModel.id;
    Get.toNamed(AppRoutes.createTodo);
    notifyListeners();
  }

  clearInputs() {
    nameErr = "";
    name.clear();
    desc.clear();
    editableId = "";
    completionDate = DateTime.now();
    notifyListeners();
  }

  validateInputs() async {
    if (name.text.isEmpty) {
      nameErr = "Please enter a name";
      notifyListeners();
      return;
    }
    nameErr = "";
    isLoading = true;
    notifyListeners();
    if (editableId.isEmpty) {
      await createTodo();
    } else {
      await editTodo();
    }
    isLoading = false;
    notifyListeners();
  }

  createTodo() async {
    try {
      String id = Utils.generateUID();
      TodoModel todoModel = TodoModel(
          id: id,
          name: name.text,
          updated_ts: DateTime.now(),
          desc: desc.text,
          completion_ts: completionDate,
          completed: false,
          userId: authRepository.getCurrentUserEmail()!);
      await todoCollection.doc(id).set(todoModel.toJson());
      Utils.showToast("Task created");
      clearInputs();
      Get.back();
    } catch (e) {
      log(e.toString());
      Utils.showToast("Error creating task");
    }
  }

  editTodo() async {
    try {
      TodoModel todoModel = TodoModel(
          name: name.text,
          id: editableId,
          updated_ts: DateTime.now(),
          desc: desc.text,
          completed: false,
          completion_ts: completionDate,
          userId: authRepository.getCurrentUserEmail()!);
      await todoCollection.doc(editableId).set(todoModel.toJson());
      Utils.showToast("Task updated");
      clearInputs();
      Get.back();
    } catch (e) {
      log(e.toString());
      Utils.showToast("Error updating task");
    }
  }

  deleteTask(context, TodoModel todoModel) async {
    Dialogs.showConfirmationDialog(context, () async {
      await deleteRecord(todoModel.id);
    }, () {}, "Delete task", "Are you sure to delete this task ?");
  }

  markComplete(context, TodoModel todoModel) async {
    Dialogs.showConfirmationDialog(context, () async {
      await completeTask(todoModel);
    }, () {}, "Complete task",
        "Are you sure to mark as complete for this task ?");
  }

  completeTask(TodoModel todoModel) async {
    try {
      todoModel.completed = true;
      log(todoModel.toJson().toString());
      await todoCollection.doc(todoModel.id).update(todoModel.toJson());
      Utils.showToast("Task completed");
    } catch (e) {
      log(e.toString());
      Utils.showToast("Error completing task");
    }
  }

  deleteRecord(id) async {
    try {
      await todoCollection.doc(id).delete();
      Utils.showToast("Task deleted");
    } catch (e) {
      log(e.toString());
      Utils.showToast("Error deleting task");
    }
  }

  void pickCompletionDate(BuildContext context) async {
    DateTime now = DateTime.now();
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: completionDate,
        firstDate: DateTime(now.year, now.month, now.day),
        lastDate: DateTime(2024));
    if (picked != null) {
      completionDate = picked;
      notifyListeners();
    }
  }
}
