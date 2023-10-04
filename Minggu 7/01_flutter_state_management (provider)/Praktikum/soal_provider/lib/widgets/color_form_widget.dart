import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:soal_provider/provider/color_form_provider.dart';

class ColorFormWidget extends StatelessWidget {
  final BuildContext context;
  const ColorFormWidget({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorFormProvider>(
      builder: (context, colorFormProvider, child) =>
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Color'),
        const SizedBox(height: 12),
        Container(
            width: double.infinity,
            height: 180,
            color: colorFormProvider.colorValue),
        const SizedBox(height: 12),
        Center(
            child: ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                              title: const Text('Pick Your Color'),
                              content: BlockPicker(
                                pickerColor: colorFormProvider.colorValue,
                                onColorChanged: (color) {
                                  colorFormProvider.setColor(color);
                                },
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Save'))
                              ]));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: colorFormProvider.colorValue,
                    foregroundColor: Colors.white),
                child: const Text('Pick Color'))),
      ]),
    );
  }
}
