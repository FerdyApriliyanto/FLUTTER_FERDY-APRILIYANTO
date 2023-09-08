#summary

1. Branching merupakan metode untuk menentukan proses arah jalannya sebuah aplikasi. Dalam dart, branching dapat dilakukan dengan beberapa metode seperti if conditional dan switch case. If merupakan metode branching paling umum dan dapat ditulis versi lebih singkatnya dengan bantuan ternary operator.
- Contoh penggunaan IF
```dart
void main() {
    int number = 1;

    if(number == 1) {
        print('Success');
    } else {
        print('Failed');
    }
}
```

2. Looping digunakan untuk mejalankan kode yang sama berulang kali sampai batas tertentu. Looping dalam dart dapat digunakan melalui beberapa metode seperti for, while, dan do while. Perbedaannya adalah kalau for kita dapat atau sudah mengetahui batas akhir perulangan tersebut terjadi sedangkan untuk while digunakan ketika kita tidak tau batas akhir dari perulangan tersebut. Yang terakhir, do while sedikit mirip dengan while tapi do while akan menjalankan perintah minimal 1 kali ketika dijalankan, baru masuk ke kondisi logic.
- Contoh penggunaan looping for untuk mencetak angka dari 1 sampai 10
```dart
void main() {
    for (int i = 1; i <= 10; i++) {
        print(i);
    }
}
```

3. Function merupakan sekumpulan kode yang dapat digunakan ulang. Di dalam function kita juga dapat menggunakan parameter untuk menerima data kiriman dari luar function yang dapat digunakan di dalam function itu sendiri. Function memiliki macam-macam tipe data antara lain void, int dan string. Perbedaannya adalah kalau function dengan tipe data void tidak mengembalikan nilai kembalian atau tidak membutuhkan return sedangkan function int atau string membutuhkan nilai kembalian atau return value. Secara umum, parameter di dalam dart juga dibagi menjadi beberapa jenis yaitu optional dan required.
- Contoh penggunaan function untuk mengalikan dua angka dengan menggunakan parameter
```dart
int multiplyNumber(int number1, int number2) {
  return number1 * number2;
}

void main() {
    print(multiplyNumber(2,3));
}
```