import 'package:flutter/material.dart';

import 'custom_input.dart';

class CustomDatePicker extends StatelessWidget {
  final String placeholder;
  final String value;
  final void Function()? callback;
  const CustomDatePicker(
      {required this.placeholder, this.value = "", this.callback, super.key});

  @override
  Widget build(BuildContext context) {
    return InputWidget(
      controller: TextEditingController(text: value),
      readOnly: true,
      placeHolder: placeholder,
      suffixWid: const Icon(Icons.date_range),
      onTap: callback,
    );
  }
}
