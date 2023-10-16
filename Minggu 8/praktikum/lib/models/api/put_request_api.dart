import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PutRequestApi {
  Future<String> putData({required Map<String, dynamic> dataPut}) async {
    try {
      final response = await Dio()
          .put('https://jsonplaceholder.typicode.com/posts/1', data: dataPut);

      debugPrint(response.data.toString());
      return response.statusCode.toString();
    } catch (e) {
      throw Exception(e);
    }
  }
}
