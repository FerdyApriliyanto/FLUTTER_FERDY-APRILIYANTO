import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soal_provider/provider/file_form_provider.dart';

class FileFormWidget extends StatelessWidget {
  final BuildContext context;
  const FileFormWidget({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    final fileFormProvider = Provider.of<FileFormProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Pick Files'),
        Consumer<FileFormProvider>(
          builder: (context, fileConsumer, child) =>
              Text('File Picked : ${fileConsumer.fileValue}'),
        ),
        const SizedBox(height: 16),
        Center(
            child: ElevatedButton(
                onPressed: () {
                  fileFormProvider.pickFile();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white),
                child: const Text('Pick and Open File')))
      ],
    );
  }
}
