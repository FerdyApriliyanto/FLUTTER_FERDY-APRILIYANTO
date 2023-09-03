import 'package:no_1_2/no_1_2.dart' as no_1_2;

class BangunRuang {
  int p, l, t;

  BangunRuang(this.p, this.l, this.t);

  volume() {
    return p * l * t;
  }
}

class Kubus extends BangunRuang {
  int sisi = 0;

  Kubus({int? p, int? l, int? t, required this.sisi})
      : super(p ?? 0, l ?? 0, t ?? 0);

  @override
  volume() {
    return sisi * sisi * sisi;
  }
}

class Balok extends BangunRuang {
  Balok({required p, l, t}) : super(p, l, t);
}

void main(List<String> arguments) {
  Kubus kubus1 = Kubus(sisi: 2);
  print(kubus1.volume());

  Balok balok1 = Balok(p: 1, l: 2, t: 3);
  print(balok1.volume());
}
