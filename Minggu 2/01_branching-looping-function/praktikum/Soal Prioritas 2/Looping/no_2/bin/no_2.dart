import 'package:no_2/no_2.dart' as no_2;

void main(List<String> arguments) {
  for (int i = 11; i >= 1; i--) {
    if (i % 2 == 1) {
      print((' ' * (11 - (i ~/ 2))) + ('0' * i));
    }
  }
  for (int i = 2; i <= 11; i++) {
    if (i % 2 == 1) {
      print((' ' * (11 - (i ~/ 2))) + ('0' * i));
    }
  }
}
