import 'package:no_2/no_2.dart' as no_2;

void main(List<String> arguments) {
  int angka = 24;

  for (int i = 1; i <= angka; i++) {
    if (angka % i == 0) {
      print(i);
    }
  }
}
