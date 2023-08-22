import 'package:no_1/no_1.dart' as no_1;

void main(List<String> arguments) {
  int nilai = 90;
  String grade;

  if (nilai > 70) {
    grade = "A";
  } else if (nilai > 40) {
    grade = "B";
  } else if (nilai > 0) {
    grade = "C";
  } else {
    grade = "";
  }

  print('Nilai anda termasuk grade $grade');
}
