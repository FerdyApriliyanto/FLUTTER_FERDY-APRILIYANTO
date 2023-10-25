import 'package:dio/dio.dart';
import 'package:soal_openai/constants/open_ai.dart';
import 'package:soal_openai/models/openai_model.dart';

class OpenAIApi {
  Future<String> getPhoneRecommendation(
      {required String budget,
      required String camera,
      required String internalStorage}) async {
    final Map<String, dynamic> data = {
      "model": "gpt-3.5-turbo",
      "messages": [
        {
          "role": "user",
          "content":
              "You are a smartphone expert. Give me a smartphone recommendation with budget IDR $budget, camera starting from ${camera}mp and internal storage at least ${internalStorage}GB"
        }
      ],
      "temperature": 0.7
    };

    late OpenAiModel response = OpenAiModel(
        id: "",
        object: "",
        created: 0,
        model: "",
        choices: [],
        usage: Usage(promptTokens: 0, completionTokens: 0, totalTokens: 0));

    try {
      final postToAPI = await Dio().post(
          'https://api.openai.com/v1/chat/completions',
          data: data,
          options: Options(headers: {"Authorization": "Bearer $apiKey"}));

      response = OpenAiModel.fromJson(postToAPI.data);
      return response.choices[0].message.content;
    } catch (e) {
      throw Exception(e);
    }
  }
}
