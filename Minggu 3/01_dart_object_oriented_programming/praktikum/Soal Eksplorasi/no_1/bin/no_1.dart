import 'package:no_1/no_1.dart' as no_1;

class Buku {
  final int id;
  final String judul;
  final String penerbit;
  final double harga;
  final String kategori;

  Buku(
      {required this.id,
      required this.judul,
      required this.penerbit,
      required this.harga,
      required this.kategori});
}

class KelolaBuku {
  List<Buku> daftarBuku = [];

  void tambahBuku(Buku dataBuku) {
    daftarBuku.add(dataBuku);
  }

  void hapusBuku(int id) {
    daftarBuku.removeWhere((buku) => buku.id == id);
  }

  List getSemuaBuku() {
    return daftarBuku;
  }
}

void main(List<String> arguments) {
  Buku buku1 = Buku(
      id: 1,
      judul: 'Matematika',
      penerbit: 'Sidu',
      harga: 25000,
      kategori: 'non fiksi');

  Buku buku2 = Buku(
      id: 2,
      judul: 'Bahasa Indonesia',
      penerbit: 'Erlangga',
      harga: 26000,
      kategori: 'non fiksi');

  KelolaBuku kelolaBuku = KelolaBuku();
  var semuaBuku = kelolaBuku.getSemuaBuku();

  kelolaBuku.tambahBuku(buku1);
  kelolaBuku.tambahBuku(buku2);

  print('DAFTAR BUKU : ');
  print('===================');
  for (var buku in semuaBuku) {
    print(
        'Judul : ${buku.judul} \nPenerbit : ${buku.penerbit} \nHarga : Rp ${buku.harga} \n');
  }

  // Hapus buku dari list dengan Id = 1 (Matematika)
  kelolaBuku.hapusBuku(1);
  print('DAFTAR BUKU Setelah dihapus : ');
  print('===================');
  for (var buku in semuaBuku) {
    print(
        'Judul : ${buku.judul} \nPenerbit : ${buku.penerbit} \nHarga : Rp ${buku.harga} \n');
  }
}
