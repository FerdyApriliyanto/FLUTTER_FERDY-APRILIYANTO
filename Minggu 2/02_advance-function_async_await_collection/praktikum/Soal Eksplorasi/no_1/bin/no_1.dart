import 'package:no_1/no_1.dart' as no_1;

void main(List<String> arguments) {
  List<String> data = [
    'Amuse',
    'Tommy Kaira',
    'Spoon',
    'HKS',
    'Litchfield',
    'Amuse',
    'HKS'
  ];
  List<String> dataUnik = data.toSet().toList();

  print(dataUnik);
}
