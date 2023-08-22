import 'package:no_1/no_1.dart' as no_1;

void main(List<String> arguments) {
  int angka = 23;

  if (isPrima(angka: angka)) {
    print("bilangan prima");
  } else {
    print("bukan bilangan prima");
  }
}

isPrima({required int angka}) {
  if (angka <= 1) {
    return false;
  }

  for (int i = 2; i <= angka / 2; i++) {
    if (angka % i == 0) {
      return false;
    }
  }

  return true;
}
