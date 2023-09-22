# summary

1. Untuk menerima inputtan dalam bentuk tanggal, dalam flutter kita dapat menggunakan fungsi bawaan yaitu showDatePicker. showDatePicker memiliki tipe data future dan akan menampilkan UI calendar material design yang dapat diganti propertynya seperti initialDate (tahun yang terpilih secara default saat membuka tampilan UI), firstDate (tahun pertama/terlama yang tersedia untuk dipilih), lastDate (tahun terbary yang tersedia untuk dipilih).

- Contoh penggunaan DatePicker dalam bentuk Function

```dart
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
```

2. Untuk menerima inputtan dalam bentuk warna, kita dapat menggunakan color picker dengan tambahan packages flutter_colorpicker. Packages ini menyediakan berbagai metode untuk user dapat memilih warna seperti memilih icon yang mewakilkan warna (BlockPicker), memilih warna dengan opsi paling lengkap (ColorPicker), dan memilih property warna menggunakan slider (SlidePicker).

- Contoh penggunaan BlockPicker yang ditempatkan di dalam sebuah pop up dialog

```dart
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
```

3. Untuk mengambil dan membuka gambar dari folder local device user, kita dapat menggunakan packages file_picker dan open_file. File yang dapat diambil bermacam-macam mulai dari document hingga gambar.

- Contoh penggunaan FilePicker dan OpenFile

```dart
void openFile(PlatformFile file) {
  OpenFile.open(file.path);
}

void pickFile() async {
  final result = await FilePicker.platform.pickFiles();
  if (result == null) return;

  final file = result.files.first;
  openFile(file);
}

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
```
   
