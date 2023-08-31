import 'package:no_1/no_1.dart' as no_1;

class Calculator {
  int nilai1 = 0, nilai2 = 0;

  Calculator({required this.nilai1, required this.nilai2});

  int penjumlahan() {
    return nilai1 + nilai2;
  }

  int pengurangan() {
    return nilai1 - nilai2;
  }

  int perkalian() {
    return nilai1 * nilai2;
  }

  double pembagian() {
    return nilai1 / nilai2;
  }
}

void main(List<String> arguments) {
  Calculator calculate1 = Calculator(nilai1: 1, nilai2: 2);

  print(calculate1.penjumlahan());
  print(calculate1.pengurangan());
  print(calculate1.perkalian());
  print(calculate1.pembagian());
}
