part of 'file_picker_bloc.dart';

sealed class FilePickerState extends Equatable {
  const FilePickerState();
}

final class FilePickerInitial extends FilePickerState {
  @override
  List<Object> get props => [];
}

final class FilePicked extends FilePickerState {
  final String fileName;

  const FilePicked({required this.fileName});

  @override
  List<Object> get props => [fileName];
}
