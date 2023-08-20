import 'package:no_1/no_1.dart' as no_1;

void main(List<String> arguments) {
  String kalimat = 'kasur rusak';

  if (isPalindrome(kalimat)) {
    print('palindrom');
  } else {
    print('bukan palindrom');
  }
}

bool isPalindrome(String kalimat) {
  String reversedKalimat = kalimat.split('').reversed.join('');
  return kalimat.toLowerCase() == reversedKalimat.toLowerCase();
}
