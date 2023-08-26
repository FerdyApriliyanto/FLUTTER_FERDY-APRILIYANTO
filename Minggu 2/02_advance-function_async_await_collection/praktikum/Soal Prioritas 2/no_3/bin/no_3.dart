import 'package:no_3/no_3.dart' as no_3;

Future<void> cariFaktorial({required int n}) async {
  int faktorial = 1;

  await Future.delayed(Duration(seconds: 2));
  for (int i = n; i > 0; i--) {
    faktorial *= i;
  }

  print(faktorial);
}

void main(List<String> arguments) {
  int n = 5;

  cariFaktorial(n: n);
  print('calculating...');
}
