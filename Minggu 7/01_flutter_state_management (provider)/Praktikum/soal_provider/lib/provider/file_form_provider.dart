import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class FileFormProvider with ChangeNotifier {
  String _fileValue = '';
  String get fileValue => _fileValue;

  void setFileValue(String selectedFileName) {
    _fileValue = selectedFileName;
  }

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  void pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    _openFile(file);

    _fileValue = file.name;
    notifyListeners();
  }
}
