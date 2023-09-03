import 'package:no_1_2/no_1_2.dart' as no_1_2;

class Matematika {
  hasil() {}
}

class KelipatanPersekutuanTerkecil implements Matematika {
  int x, y;

  KelipatanPersekutuanTerkecil({required this.x, required this.y});

  @override
  hasil() {
    int max = (x > y) ? x : y;
    while (true) {
      if (max % x == 0 && max % y == 0) {
        return max;
      }
      max++;
    }
  }
}

class FaktorPersekutuanTerbesar implements Matematika {
  int x, y;

  FaktorPersekutuanTerbesar({required this.x, required this.y});

  @override
  hasil() {
    while (x != y) {
      if (x > y) {
        x -= y;
      } else {
        y -= x;
      }
    }
    return x;
  }
}

void main(List<String> arguments) {
  KelipatanPersekutuanTerkecil kpk1 =
      KelipatanPersekutuanTerkecil(x: 25, y: 15);

  print(kpk1.hasil());

  FaktorPersekutuanTerbesar fpb1 = FaktorPersekutuanTerbesar(x: 25, y: 15);
  print(fpb1.hasil());
}
