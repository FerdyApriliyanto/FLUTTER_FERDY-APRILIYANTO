part of 'color_picker_bloc.dart';

sealed class ColorPickerEvent extends Equatable {
  const ColorPickerEvent();
}

class OpenColorPicker extends ColorPickerEvent {
  final BuildContext context;

  const OpenColorPicker({required this.context});

  @override
  List<Object> get props => [];
}

class SetColorPicked extends ColorPickerEvent {
  final Color newColor;

  const SetColorPicked({required this.newColor});

  @override
  List<Object> get props => [newColor];
}
