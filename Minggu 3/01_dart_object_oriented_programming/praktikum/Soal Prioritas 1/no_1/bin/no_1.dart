import 'package:no_1/no_1.dart' as no_1;

class Hewan {
  int? berat;

  Hewan({required this.berat});
}

void main(List<String> arguments) {
  Hewan sapi = Hewan(berat: 12);
  print(sapi.berat);
}
