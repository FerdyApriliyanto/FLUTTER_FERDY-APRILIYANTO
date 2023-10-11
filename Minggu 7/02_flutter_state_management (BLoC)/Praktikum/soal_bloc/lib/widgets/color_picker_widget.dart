import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soal_bloc/bloc/color_picker/color_picker_bloc.dart';

class ColorPickerWidget extends StatelessWidget {
  const ColorPickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('Color'),
      const SizedBox(height: 12),
      BlocBuilder<ColorPickerBloc, ColorPickerState>(
        builder: (context, state) {
          return Container(
              width: double.infinity,
              height: 180,
              color: state is ColorPicked ? state.selectedColor : Colors.black);
        },
      ),
      const SizedBox(height: 12),
      Center(child: BlocBuilder<ColorPickerBloc, ColorPickerState>(
        builder: (context, state) {
          return ElevatedButton(
              onPressed: () {
                context
                    .read<ColorPickerBloc>()
                    .add(OpenColorPicker(context: context));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor:
                      state is ColorPicked ? state.selectedColor : Colors.black,
                  foregroundColor: Colors.white),
              child: const Text('Pick Color'));
        },
      )),
    ]);
  }
}
