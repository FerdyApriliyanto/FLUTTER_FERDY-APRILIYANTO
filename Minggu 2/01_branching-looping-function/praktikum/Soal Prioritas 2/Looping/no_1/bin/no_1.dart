import 'package:no_1/no_1.dart' as no_1;

void main(List<String> arguments) {
  int row = 16;

  for (int i = 1; i <= row; i++) {
    if (i % 2 == 1) {
      print((' ' * (row - i)) + ('* ' * i));
    }
  }
}
