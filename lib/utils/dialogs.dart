import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/widgets/custom_text.dart';

class Dialogs {
  static showConfirmationDialog(
    context,
    yesAction,
    noAction,
    title,
    desc, {
    firstAction = 'Yes',
    secondAction = 'No',
  }) async {
    await showCupertinoDialog(
        context: context,
        builder: (BuildContext ctx) {
          return CupertinoAlertDialog(
            title: CustomText(text: title, fontWeight: FontWeight.w600),
            content: CustomText(text: "\n $desc", fontSize: 13),
            actions: [
              // The "Yes" button
              CupertinoDialogAction(
                onPressed: () {
                  Get.back();
                  yesAction();
                },
                isDefaultAction: true,
                isDestructiveAction: true,
                child: Text(firstAction),
              ),
              // The "No" button
              CupertinoDialogAction(
                onPressed: () {
                  Get.back();
                  noAction();
                },
                isDefaultAction: false,
                isDestructiveAction: false,
                child: Text(secondAction),
              )
            ],
          );
        });
  }
}
