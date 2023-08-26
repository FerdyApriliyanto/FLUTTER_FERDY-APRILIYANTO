import 'package:no_1/no_1.dart' as no_1;

void main(List<String> arguments) {
  List<int> angka = [];

  List<int> angkaGanjil = [1, 3];
  List<int> angkaGenap = [2, 4];

  angka.addAll(angkaGanjil);
  angka.addAll(angkaGenap);

  Map<String, dynamic> kumpulanAngka = {'Angka': angka};

  print(kumpulanAngka);
}
