import 'package:no_1/no_1.dart' as no_1;

void main(List<String> arguments) {
  final phi = 3.14;
  int r = 5;

  var hasilLuasLingkaran = luasLingkaran(phi: phi, r: r);
  print(hasilLuasLingkaran);
}

luasLingkaran({required phi, required int r}) {
  var luas = phi * r * r;

  return luas;
}
