#summary

1. Fungsi dalam dart memiliki berbagai jenis yaitu anonymous function yang tidak memiliki nama serta berfungsi sebagai data dan arrow function yang penulisannya lebih singkat dengan ciri tanda => yang melambangkan fungsi returnnya.
- Contoh penggunaan anonymous function dengan menggunakan arrow
```dart
void main() {
var multiplyNumber = (int number1, int number2) => number1 * number2;

print (multiplyNumber(2,3));
}
```

2. Async dalam dart biasa diletakkan pada sebuah function untuk menandakan bahwa proses function tersebut isinya berjalan secara asynchronus. Async berarti proses yang dijalankan tidak harus berurut ketika proses tersebut memakan waktu dan dapat dilanjutkan ke proses lain sambil menunggu proses async selesai. Sedangkan await berarti menandakan untuk menunggu proses async hingga selesai baru dilanjutkan ke proses berikutnya.
- Contoh
```dart
Future<void> cariFaktorial({required int n}) async {
  int faktorial = 1;

  await Future.delayed(Duration(seconds: 2));
  for (int i = n; i > 0; i--) {
    faktorial *= i;
  }

  print(faktorial);
}

void main(List<String> arguments) {
  int n = 5;

  cariFaktorial(n: n);
  print('calculating...');
}
```

3. Tipe data collection (list, map)
-Tipe data collection terdiri dari list dan map. List merupakan tipe data yang menampung banyak data (multiple value) secara berbaris yang disebut elemen dan tiap elemen memiliki index sebagai sarana untuk mengakses data secara satu per satu. Sedangkan map merupakan tipe data multiple value juga tapi menyimpan data secara key-value yang berguna seperti index pada list, dan cara pengaksesannya pun melalui nama key yang mewakili masing-masing data.
- Contoh penggunaan list dengan tipe data String
```dart
void main() {
List<String> name = ['Budi', 'Anton', 'Bunga'];

print(name);
}
```

- Contoh penggunaan map
```dart
void main() {
Map<String, int> person = {
    'Budi': 21,
    'Anton': 19,
    'Bunga': 25,
};

print(person);
}
```