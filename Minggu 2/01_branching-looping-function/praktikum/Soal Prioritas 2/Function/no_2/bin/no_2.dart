import 'package:no_2/no_2.dart' as no_2;

void main(List<String> arguments) {
  int a = 10;
  int b = 40;
  int c = 50;

  cariFaktorial(a);
  cariFaktorialBig(b);
  cariFaktorialBig(c);
}

// Untuk mencari nilai faktorial a
cariFaktorial(int angka) {
  int sum = 1;

  for (int i = 1; i <= angka; i++) {
    sum *= i;
  }

  print(sum);
}

// Untuk mencari nilai faktorial b dan c diperlukan tipe data BigInt dikarenakan hasil faktorisasinya melebihi kapasitas maksimal integer yang menyebabkan integer overflow
cariFaktorialBig(int angka) {
  BigInt sumBig = BigInt.one;

  for (int i = 1; i <= angka; i++) {
    sumBig *= BigInt.from(i);
  }

  print(sumBig);
}
