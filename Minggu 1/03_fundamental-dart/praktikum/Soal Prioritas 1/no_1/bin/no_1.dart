import 'package:soal_prioritas_1_no1/soal_prioritas_1_no1.dart'
    as soal_prioritas_1_no1;

void main(List<String> arguments) {
  // Luas dan Keliling Persegi
  int sisi = 2;

  int luasPersegi = 2 * sisi;
  int kelilingPersegi = 4 * sisi;

  print("Luas Persegi = $luasPersegi");
  print("Keliling Persegi = $kelilingPersegi");
  print("==============================");

  // Luas dan Keliling Persegi Panjang
  int panjang = 4;
  int lebar = 2;

  int luasPersegiPanjang = panjang * lebar;
  int kelilingPersegiPanjang = (2 * panjang) + (2 * lebar);

  print("Luas Persegi Panjang= $luasPersegiPanjang");
  print("Keliling Persegi Panjang = $kelilingPersegiPanjang");
}
