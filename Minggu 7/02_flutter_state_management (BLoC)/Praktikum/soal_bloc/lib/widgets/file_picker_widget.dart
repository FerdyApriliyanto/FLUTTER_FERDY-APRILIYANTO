import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soal_bloc/bloc/file_picker/file_picker_bloc.dart';

class FilePickerWidget extends StatelessWidget {
  const FilePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String fileName = '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Pick Files'),
        BlocBuilder<FilePickerBloc, FilePickerState>(
          builder: (context, state) {
            state is FilePicked ? fileName = state.fileName : '';
            return Text('File Picked : $fileName');
          },
        ),
        const SizedBox(height: 16),
        Center(
            child: ElevatedButton(
                onPressed: () {
                  context.read<FilePickerBloc>().add(OpenFilePicker());
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white),
                child: const Text('Pick and Open File')))
      ],
    );
  }
}
