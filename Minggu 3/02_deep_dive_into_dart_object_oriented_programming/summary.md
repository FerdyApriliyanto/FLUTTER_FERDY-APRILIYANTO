#summary

1. Dalam OOP dart kita dapat memanggil method dalam class secara default(langsung) saat pembuatan object dengan menggunakan constructor yang ditulis seperti method biasa tetapi nama methodnya sama dengan nama class. Constructor dapat menerima parameter tetapi tidak memiliki nilai return.
- Contoh penggunaan constructor dengan menggunakan required parameter
```dart
class Person {
    String firstName;
    String lastName;

    Person({required this.firstName, required this.lastName});
}
```

2. Dalam OOP dart juga terdapat konsep inheritance dan interface yang bertujuan untuk memanfaatkan kembali class yang sudah ada beserta property dan methodnya. Perbedaan paling mencolok diantara dua konsep ini yaitu adalah inheritance menggunakan perintah extends saat pembuatan class turunan dan tidak wajib meng-override semua method yang ada pada class induknya (super class) sedangkan interface menggunakan perintah implements dan mewajibkan seluruh method yang ada pada superclass dioverride di kelas turunannya.
- Contoh penggunaan inheritance
```dart
class Person {
    void walking(){
        print('Walking...');
    }
}

class Teacher extends Person{
    //
}
```
- Dengan class Teacher yang mewarisi class Person, maka method yang ada pada class Person juga akan dapat digunakan melalui class Teacher
```dart
void main() {
    Teacher teacher1 = Teacher();
    teacher1.walking();
}
```
- Contoh penggunaan interface
```dart
class Person {
    void walking(){
        print('Walking...');
    }
}

class Teacher implements Person{
    @override
    void walking(){
      print('Teacher walking...');
    }
}
```

3. Pada class terdapat tipe data generics yang berfungsi menerima data dengan tipe apa saja. Generics ditulis setelah nama class atau fungsi dengan diberi tanda <>. Generics dapat digunakan di seluruh class dan fungsi. Namun ketika menggunakan tipe data generics maka saat pembuatan object atau pemanggilan fungsi harus diinisialisasikan dulu tipe data apa yang akan digunakan dengan memberi tanda <> yang berisikan nama tipe data dan ditulis setelah nama class/fungsi.
- Contoh penggunaan class dengan tipe data generics yang menerima data int dan String pada object yang berbeda
```dart
class Box<T> {
    var value;

    Box({required this.value});

    T getValue() {
        return value;
    }
}

void main() {
  Box intBox = Box<int>(value: 10);
  Box stringBox = Box<String>(value: 'Box string value');

  print(intBox.getValue());
  print(stringBox.getValue());
}
```