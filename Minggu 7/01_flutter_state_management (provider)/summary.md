# summary

1. Dalam flutter state merupakan keadaan atau kondisi yang dibaca saat pembuatan widget. State dapat berubah saat widget sedang aktif namun diperlukan fungsi tambahan jika ingin merebuild widget secara real time ketika state itu berubah yaitu setState yang hanya terdapat pada StatefulWidget. Kita juga dapat membuat global state menggunakan salah satu state management flutter yaitu provider yang dapat dipakai dimana saja dan mengganti penggunaaan StatefulWidget dan setState dengan notifyListeners;

2. Untuk menggunakan state management provider kita perlu mendefinisikannya terlebih dahulu di fungsi main. Untuk menggunakan provider dalam jumlah banyak maka kita menggunakan MultiProvider dengan parameter constructor providers yang akan menampung list class ChangeNotifierProvider kita.

- Contoh penggunaan MultiProvider pada fungsi main

```dart
void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => NameFormProvider()),
      ChangeNotifierProvider(create: (_) => PhoneFormProvider()),
      ChangeNotifierProvider(create: (_) => CrudProvider()),
      ChangeNotifierProvider(create: (_) => DateFormProvider()),
      ChangeNotifierProvider(create: (_) => ColorFormProvider()),
      ChangeNotifierProvider(create: (_) => FileFormProvider()),
    ],
    child: const MyApp(),
  ));
}
```

3. Untuk memanggil state provider ke dalam UI kita dapat menggunakan 2 cara yaitu dengan menggunakan Provider.of dan Consumer. Provider.of lebih sering digunakan ketika kita hanya membutuhkan data(state) atau function dari class providernya sedangkan Consumer digunakan untuk membungkus widget tree yang datanya akan berubah dan direbuild berdasarkan state. Penggunaan Consumer direkomendasikan untuk membungkus widget tree terkecil yang berubah sehingga dapat menghindari rebuild UI yang tidak perlu dan akan menambah peforma aplikasi juga.

- Contoh class provider untuk user memilih tanggal dan merubah teks menjadi tanggal yang dipilih

```dart
class DateFormProvider with ChangeNotifier {
  DateTime _dateValue = DateTime.now();
  DateTime get dateValue => _dateValue;

  void setDateValue(DateTime selectedDate) {
    _dateValue = selectedDate;
    notifyListeners();
  }

  void openDatePicker(BuildContext context) async {
    final getDatePicker = await showDatePicker(
        context: context,
        initialDate: _dateValue,
        firstDate: DateTime(1970),
        lastDate: DateTime(_dateValue.year + 10));

    if (getDatePicker != null) {
      _dateValue = getDatePicker;
      notifyListeners();
    }
  }
}
```

- Contoh pemanggilan provider ke dalam UI menggunakan Provider.of untuk memanggil fungsi openDatePicker dari class DateFormProvider dan Consumer untuk merebuild widget Text ketika dateValuenya berubah.

```dart
class DateFormWidget extends StatelessWidget {
  final BuildContext context;
  const DateFormWidget({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    final dateFormProvider = Provider.of<DateFormProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Date'),
            TextButton(
              child: const Text('Select'),
              onPressed: () {
                dateFormProvider.openDatePicker(context);
              },
            )
          ],
        ),
        Consumer<DateFormProvider>(
          builder: (context, dateConsumer, child) =>
              Text(DateFormat('dd-MM-yyyy').format(dateConsumer.dateValue)),
        ),
      ],
    );
  }
}
```
