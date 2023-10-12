import 'package:flutter/material.dart';
import 'package:project/colors/global_color.dart';

class TextFieldWidget extends StatelessWidget {
  final String fieldLabel;
  final bool? isTextArea;
  final TextEditingController fieldController;

  const TextFieldWidget(
      {super.key,
      required this.fieldLabel,
      this.isTextArea,
      required this.fieldController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: fieldController,
      decoration: InputDecoration(
        labelText: fieldLabel,
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(width: 2, color: GlobalColor().primaryColor)),
      ),
      maxLines: isTextArea == true ? 5 : 1,
    );
  }
}
