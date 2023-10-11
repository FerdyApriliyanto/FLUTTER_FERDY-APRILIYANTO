part of 'color_picker_bloc.dart';

sealed class ColorPickerState extends Equatable {
  const ColorPickerState();
}

final class ColorPickerInitial extends ColorPickerState {
  @override
  List<Object> get props => [];
}

final class ColorPicked extends ColorPickerState {
  final Color selectedColor;

  const ColorPicked({required this.selectedColor});

  @override
  List<Object> get props => [selectedColor];
}
