import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

part 'file_picker_event.dart';
part 'file_picker_state.dart';

class FilePickerBloc extends Bloc<FilePickerEvent, FilePickerState> {
  FilePickerBloc() : super(FilePickerInitial()) {
    on<OpenFilePicker>((event, emit) async {
      void openFile(PlatformFile file) {
        OpenFile.open(file.path);
      }

      final result = await FilePicker.platform.pickFiles();
      if (result == null) return;

      final file = result.files.first;
      emit(FilePicked(fileName: file.name));
      openFile(file);
    });

    on<SetFilePicked>((event, emit) {
      emit(FilePicked(fileName: event.selectedFileName));
    });
  }
}
