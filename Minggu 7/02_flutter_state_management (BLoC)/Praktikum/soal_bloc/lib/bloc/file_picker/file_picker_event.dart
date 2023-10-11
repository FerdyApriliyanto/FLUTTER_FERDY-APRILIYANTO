part of 'file_picker_bloc.dart';

sealed class FilePickerEvent extends Equatable {
  const FilePickerEvent();
}

class OpenFilePicker extends FilePickerEvent {
  @override
  List<Object> get props => [];
}

class SetFilePicked extends FilePickerEvent {
  final String selectedFileName;

  const SetFilePicked({required this.selectedFileName});

  @override
  List<Object> get props => [selectedFileName];
}
