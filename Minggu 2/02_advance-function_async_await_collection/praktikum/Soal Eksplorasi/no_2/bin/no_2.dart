import 'package:no_2/no_2.dart' as no_2;

void cariFrekuensi({required List data}) {
  Map<String, int> frekuensiData = {};

  for (int i = 0; i < data.length; i++) {
    if (frekuensiData.containsKey(data[i])) {
      frekuensiData[data[i]] = (frekuensiData[data[i]] ?? 0) + 1;
    } else {
      frekuensiData[data[i]] = 1;
    }
  }

  print(frekuensiData);
}

void main(List<String> arguments) {
  List<String> data = [
    'js',
    'js',
    'js',
    'golang',
    'python',
    'js',
    'js',
    'golang',
    'rust'
  ];

  cariFrekuensi(data: data);
}
