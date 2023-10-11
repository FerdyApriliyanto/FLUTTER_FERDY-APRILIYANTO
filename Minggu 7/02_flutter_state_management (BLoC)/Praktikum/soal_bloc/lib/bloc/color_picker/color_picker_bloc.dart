import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

part 'color_picker_bloc_event.dart';
part 'color_picker_bloc_state.dart';

class ColorPickerBloc extends Bloc<ColorPickerEvent, ColorPickerState> {
  ColorPickerBloc() : super(ColorPickerInitial()) {
    on<OpenColorPicker>((event, emit) async {
      await showDialog(
          context: event.context,
          builder: (context) => AlertDialog(
                  title: const Text('Pick Your Color'),
                  content: BlockPicker(
                    pickerColor: Colors.black,
                    onColorChanged: (color) {
                      emit(ColorPicked(selectedColor: color));
                    },
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Save'))
                  ]));
    });

    on<SetColorPicked>((event, emit) {
      emit(ColorPicked(selectedColor: event.newColor));
    });
  }
}
