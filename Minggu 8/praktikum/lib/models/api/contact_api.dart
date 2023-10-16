import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ContactApi {
  // SOAL PRIORITAS 1 No. 1
  Future<String> postContact(
      {required Map<String, dynamic> dataContact}) async {
    try {
      final postResponse = await Dio().post(
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/',
        data: dataContact,
      );

      debugPrint(postResponse.data.toString());
      return postResponse.statusCode.toString();
    } catch (e) {
      throw Exception(e);
    }
  }
  // END

  // SOAL PRIORITAS 1 No. 2
  Future<Map<String, dynamic>> getContact() async {
    try {
      final getResponse = await Dio().get(
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/2',
      );

      debugPrint(getResponse.data.toString());
      return getResponse.data;
    } catch (e) {
      throw Exception(e);
    }
  }
  // END
}
