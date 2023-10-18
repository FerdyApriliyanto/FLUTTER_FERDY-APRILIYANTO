# summary

1. Dalam pengembangan aplikasi flutter, kita dapat mengecek apakah tampilan dari aplikasi kita sudah sesuai dan bekerja dengan baik dengan menggunakan UI Testing atau lebih dikenal sebagai Widget Testing dalam flutter. Pengujian ini dilakukan pada widget-widget yang menyusun aplikasi kita dan dilakukan oleh script testing khusus yang dijalankan secara otomatis. Script untuk melakukan testing disimpan di dalam folder test dan filenya diberi nama _test pada akhirannya. Untuk menjalankan script ini, kita dapat menggunakan perintah flutter test pada terminal.

2. Keuntungan melakukan UI Testing ini selain prosesnya yang dijalankan secara otomatis adalah, dapat membantu kita dalam membangun UI yang lebih konsisten seperti button dan juga text, kita juga dapat meminimalisir bug pada aplikasi sebelum dirilis dan mengurangi bug report dari user. Lalu UI Testing dalam flutter juga mendukung cross-platform sehingga membantu memastikan bahwa aplikasi kita berjalan baik dan responsive di semua jenis platform.

3. Untuk membuat script UI Testing, diperlukan adanya fungsi main dan di dalamnya terdapat berbagai test case yang diawali dengan testWidgets. Kita dapat mengecek apakah dalam suatu halaman terdapat sebuah text maupun widget dengan menggunakan perintah expect dan find.

- Contoh script UI Testing untuk mengecek judul AppBar dan komponen dalam suatu halaman

```dart
void main() {
  testWidgets('Judul harus Contacts', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: ContactScreen(),
    ));

    expect(find.text('Contacts'), findsOneWidget);
  });

  testWidgets(
      'Body Harus memiliki title, description, field Name, Phone, dan button Submit',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: ContactScreen(),
    ));

    expect(find.text('Create New Contacts'), findsOneWidget);
    expect(
        find.text(
            'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made'),
        findsOneWidget);
    expect(find.widgetWithText(TextField, 'Name'), findsOneWidget);
    expect(find.widgetWithText(TextField, 'Phone'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Submit'), findsOneWidget);
  });
}
```
