import 'package:no_2/no_2.dart' as no_2;

class Mobil {
  int kapasitas = 0;
  int totalMuatan = 0;
  List<String> muatan = [];

  Mobil({required this.kapasitas});

  void tambahMuatan(String namaHewan, int totalBerat) {
    totalMuatan += totalBerat;
    if (totalMuatan <= kapasitas) {
      muatan.add(namaHewan);
    }
  }
}

void main(List<String> arguments) {
  Mobil mobil1 = Mobil(kapasitas: 20);

  mobil1.tambahMuatan('Sapi', 15);
  mobil1.tambahMuatan('Ayam', 4);

  print(mobil1.muatan);
}
