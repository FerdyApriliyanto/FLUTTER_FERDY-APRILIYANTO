#summary

1. Object Oriented Programming atau biasa disingkat OOP adalah konsep pemrogramman yang disusun dalam bentuk abstraksi object. Data dan proses dalam OOP diletakkan pada abstraksi tersebut sehingga memudahkan kode untuk ditroubleshoot ketika terjadi error dan memungkinkan adanya reusable code atau kode dapat digunakan ulang.

2. Dalam dart OOP, terdapat komponen Class yaitu merupakan abstraksi dari sebuah benda (object) yang terdapat beberapa komponen lain di dalamnya yaitu property, serta method.
- Contoh penggunaan class
```dart
class Person {
    //
}
```

- Contoh pemanggilan object dari class Person
```dart
void main() {
    Person person1 = Person();
}
```

3. Property merupakan sesuatu yang dimiliki oleh class tersebut dan ditulis seperti variabel biasa namun di dalam class. Sedangkan method merupakan behaviour atau kemampuan yang dapat dilakukan oleh class tersebut dan memiliki sifat seperti function namun ditulis di dalam class.
- Contoh penggunaan property
```dart
class Person {
    String? name;
}
```

- Contoh penggunaan method
```dart
class Person {
    String? name

    void printName() {
        print();
    }
}
```