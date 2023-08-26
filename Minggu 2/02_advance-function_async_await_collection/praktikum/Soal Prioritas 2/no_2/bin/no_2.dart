import 'package:no_2/no_2.dart' as no_2;

void cariRataRata({required List<int> angka}) {
  int jumlah = 0;

  for (int i = 0; i < angka.length; i++) {
    jumlah += angka[i];
  }

  var rataRata = (jumlah / angka.length).round();

  print(rataRata);
}

void main(List<String> arguments) {
  List<int> angka = [7, 5, 3, 5, 2, 1];

  cariRataRata(angka: angka);
}
