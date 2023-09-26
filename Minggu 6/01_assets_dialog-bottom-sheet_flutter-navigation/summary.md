# summary

1. Assets dalam flutter merupakan file yang dibundle dan dideploy bersamaan dengan aplikasi. Assets memungkinkan kita untuk memiliki media lokal yang dapat berbentuk seperti gambar, icon(SVG), dan juga font(ttf). Untuk menggunakan asset, kita perlu menginisialisikan dulu file/folder asset yang sudah kita buat ke dalam pubspec.yaml di bagian 'assets:', seperti '- assets/nama_gambar.png' atau untuk memasukkan semua isi folder bisa langsung memasukkan nama folder yang dituju '- assets/'.

- Contoh penggunaan asset Image yang berasal dari folder 'assets'

```dart
final List<String> imageList = const [
    'assets/dart-logo.png',
    'assets/firebase-logo.png',
    'assets/flutter-logo.png',
    'assets/flutter-logo-1.jpg'
  ];

Image.asset(imageList[1]), //No index
```

2. Untuk menampilkan semacam pop up kepada user yang berasal dari bawah layar, kita dapat menggunakan fungsi bawaan flutter yaitu showModalBottomSheet yang memiliki dua property wajib yaitu context dan builder. Kita dapat mengisi konten yang ingin kita tampilkan di dalam bottom sheet melalui property builder.

- Contoh penggunaan showModalBottomSheet yang ditrigger ketika ada event

```dart
showModalBottomSheet(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(20))),
    context: context,
    builder: (context) => SizedBox(
      width: double.infinity,
      height: 450,
      child: Column(
        children: [
          SizedBox(
              height: 250,
              width: 350,
              child: Image.asset(imageAdress, fit: BoxFit.fill)),
          const SizedBox(height: 12),
          const Text('Do you want to see this image details?'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/detail-gallery',
                        arguments: imageAdress);
                  },
                  child: const Text('Yes')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('No')),
            ],
          )
        ],
      ),
    ));
```

3. Navigation merupakan kemampuan untuk dapat berpindah halaman. Dalam flutter, navigation menggunakan konsep 'stacking' yang akan menumpuk layer halaman ketika kita berpindah halaman. Kita dapat menggunakan Navigator.push() untuk berpindah menuju halaman tujuan dan Navigator.pop() untuk kembali ke halaman sebelumnya. Kita juga dapat menggunakan Navigation Named Routes yang mewakilkan setiap class halaman dengan String, ketika menggunakan named routes maka kita menggunakan Navigation.pushNamed() untuk berpindah halaman, arguments untuk mengirim data ke page yang dituju dan juga kita perlu menginisialisasikan semua route di dalam MaterialApp serta menentukan initialRoutenya sebagai pengganti home. Terdapat juga beberapa jenis navigasi lain seperti Navigator.pushReplacement/pushReplacementNamed untuk langsung menghapus layer layar yang diganti. Ada juga Navigator.pushAndRemoveUntil/pushNamedAndRemoveUntil untuk menghapus seluruh layer layar yang sudah dibuka ketika mencapat layar tertentu misalnya layar terakhir seperti payment success.

- Contoh penggunaan Navigation dengan Named Routes

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const GalleryScreen(),
        '/detail-gallery': (_) => const DetailGalleryScreen()
      },
    );
  }
}

Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/detail-gallery',
              arguments: imageAdress);
        },
        child: const Text('Yes')),
    TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('No')),
  ],
)
```
   
