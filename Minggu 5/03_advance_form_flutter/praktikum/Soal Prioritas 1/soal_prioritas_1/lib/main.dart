import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soal Prioritas 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();

  Color currentColor = Colors.black;

  void openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  void pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    openFile(file);
  }

  // DatePicker
  Widget buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Date'),
            TextButton(
              child: const Text('Select'),
              onPressed: () async {
                final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: currentDate,
                    firstDate: DateTime(1990),
                    lastDate: DateTime(currentDate.year + 5));
                setState(() {
                  if (selectedDate != null) {
                    _dueDate = selectedDate;
                  }
                });
              },
            )
          ],
        ),
        Text(DateFormat('dd-MM-yyyy').format(_dueDate)),
      ],
    );
  }
  // End of DatePicker

  // ColorPicker
  Widget buildColorPicker(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('Color'),
      const SizedBox(height: 12),
      Container(width: double.infinity, height: 180, color: currentColor),
      const SizedBox(height: 12),
      Center(
          child: ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                            title: const Text('Pick Your Color'),
                            content: BlockPicker(
                              pickerColor: currentColor,
                              onColorChanged: (color) {
                                setState(() {
                                  currentColor = color;
                                });
                              },
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Save'))
                            ]));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: currentColor, foregroundColor: Colors.white),
              child: const Text('Pick Color'))),
    ]);
  }
  // End of ColorPicker

  // FilePicker
  Widget buildFilePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Pick Files'),
        const SizedBox(height: 16),
        Center(
            child: ElevatedButton(
                onPressed: () {
                  pickFile();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white),
                child: const Text('Pick and Open File')))
      ],
    );
  }
  // End of FilePicker

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Interactive Widgets'),
          centerTitle: true,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              buildDatePicker(context),
              const SizedBox(height: 16),
              buildColorPicker(context),
              const SizedBox(height: 16),
              buildFilePicker(context)
            ],
          ),
        ));
  }
}
