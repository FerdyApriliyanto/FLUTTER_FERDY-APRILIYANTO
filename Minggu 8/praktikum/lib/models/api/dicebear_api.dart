import 'package:dio/dio.dart';

class DiceBearApi {
  Future<String> generateImage(
      {required String style, required String seed}) async {
    try {
      final response =
          await Dio().get('https://api.dicebear.com/7.x/$style/svg?seed=$seed');

      return response.data as String;
    } catch (e) {
      throw Exception(e);
    }
  }
}
