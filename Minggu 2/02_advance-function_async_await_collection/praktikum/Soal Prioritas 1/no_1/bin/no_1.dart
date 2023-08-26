import 'package:no_1/no_1.dart' as no_1;

Future<List> pengaliList(List<int> data, int pengali) async {
  List<int> dataBaru = [];

  await Future.delayed(Duration(seconds: 2));
  for (int i = 0; i < data.length; i++) {
    dataBaru.add(data[i] * pengali);
  }

  return dataBaru;
}

void main(List<String> arguments) async {
  List<int> data = [1, 2, 3, 4, 5, 6];
  var pengaliPertama = await pengaliList(data, 2);

  print(pengaliPertama);
}
