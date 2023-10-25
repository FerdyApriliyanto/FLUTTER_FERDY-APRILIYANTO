# summary

1. OpenAI merupakan perusahaan pengembang AI terkemuka yang terkenal dengan produk ChatGPTnya yaitu sebuah AI chat bot yang dapat melakukan interaksi dengan manusia. OpenAI juga menyediakan API untuk para developer yang ingin memanfaatkan teknologi AI ini. API ini nantinya akan menerima sebuah prompt berdasarkan inputtan dari user dan dapat mengembalikan respon yang diminta dari prompt tersebut. Keuntungan dari penggunaan API ini adalah cara penggunaannya yang mudah dan dokumentasinya lengkap, dapat digunakan di berbagai perangkat dan memiliki jumlah parameter yang sangat banyak.

2. Untuk melakukan request API ke endpoint milik OpenAI, kita perlu memasukkan beberapa request body yang diperlukan seperi model dan message/promptnya.

- Contoh class untuk melakukan request POST ke OpenAI dengan prompt untuk mendapatkan rekomendasi smartphone berdasarkan data yang diberikan oleh user seperti budget, camera dan internal storagenya. Method dari class ini nantinya akan mengembalikan sebuah string berisi rekomendasi smartphone yang digenerate oleh AI

```dart
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
```

3. Untuk menampung data response dari API tadi, kita perlu membuat model berdasarkan response body yang diberikan. Untuk mengetahui key apa saja yang diperlukan dan struktur yang diberikan oleh response, kita dapat menggunakan bantuan aplikasi Postman untuk mengirim dan menerima data dari API sebelum membuat model.

- Contoh class model untuk menampung data response yang tadi sudah dicek terlebih dahulu di Postman

```dart
class OpenAiModel {
  String id;
  String object;
  int created;
  String model;
  List<Choice> choices;
  Usage usage;

  OpenAiModel({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.choices,
    required this.usage,
  });

  factory OpenAiModel.fromJson(Map<String, dynamic> json) => OpenAiModel(
        id: json["id"],
        object: json["object"],
        created: json["created"],
        model: json["model"],
        choices:
            List<Choice>.from(json["choices"].map((x) => Choice.fromJson(x))),
        usage: Usage.fromJson(json["usage"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "object": object,
        "created": created,
        "model": model,
        "choices": List<dynamic>.from(choices.map((x) => x.toJson())),
        "usage": usage.toJson(),
      };
}
```
