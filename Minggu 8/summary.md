# summary Introduction REST API – JSON serialization/deserialization

1. Dalam flutter, kita dapat mengambil data melalui API (Application Programming Interface) dengan memanfaatkan protocol HTTP seperti POST, GET, PUT dan DELETE. Untuk mengirim data ke server API, kita dapat menggunakan bantuan package bernama Dio. Untuk menampung data dari API ke dalam local, kita dapat meng-decode response (biasanya dalam bentuk JSON) yang diterima dan menyimpannya di dalam kelas model. Sebaliknya, untuk mengirim data (request body) ke server API, kita dapat menggunakan kelas model yang di-encode menjadi JSON string.

- Contoh penggunaan HTTP method GET untuk mendapatkan image dari API berdasarkan style dan nama imagenya

```dart
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
```

2. Untuk mengirim data ke API, kita dapat menggunakan HTTP method POST dan data (request body) yang ingin kita kirim diletakkan dalam parameter data. Request body yang kita kirim berbentuk Map dan harus disesuaikan berdasarkan key dari API itu sendiri.

- Berikut contoh penggunaan HTTP method POST untuk mengirim data dengan request body berasal dari ContactModel yang disimpan dalam parameter
  
 ```dart
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
```

3. Untuk mengupdate data yang sudah ada, kita dapat menggunakan HTTP method PUT dengan request body juga, namun URLnya terdapat parameter tambahan sebagai identifier(harus unik) dan biasanya berupa ID dikarenakan sifatnya yang unik.

- Contoh penggunaan HTTP method PUT untuk mengupdate data yang memiliki id 1

```dart
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
```

# summary MVVM Architecture

1. MVVM Architecture merupakan struktur folder yang memisahkan logic dengan tampilan dan dibagi menjadi 3 komponen utama yaitu Model, View, View-Model. Dengan menggunakan MVVM, kita dapat menggunakan ViewModel yang sama jika ada tampilan yang memerlukan alur logic yang sama dan dapat memudahkan perawatan kode. Model merupakan class yang akan menampung model data yang digunakan pada view.

- Contoh class Model untuk menampung data Contact dari API

```dart
class ContactModel {
  int? id;
  String name;
  String phone;

  ContactModel({
    this.id,
    required this.name,
    required this.phone,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
      };
}
```

2. View merupakan kelas yang akan menampung tampilan UI dari aplikasi kita. Kelas ini yang akan membangun tampilan aplikasi kita saat program dijalankan dan akan mengconsume data dari ViewModel.
  
- Contoh class View untuk membangun tampilan UI contact form yang dapat mengirim dan mendapatkan data dari API

```dart
class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  void openDialog(
      {required BuildContext context,
      required String title,
      required List<Widget> content}) {
    showDialog(
        context: (context),
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: SizedBox(
              height: 200,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: content),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final contactProviderNotListening =
        Provider.of<ContactViewModel>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Contact'),
          centerTitle: true,
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                  label: 'Name',
                  controller: contactProviderNotListening.nameController),
              const SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                  label: 'Phone',
                  controller: contactProviderNotListening.phoneController),
              const SizedBox(
                height: 20,
              ),

              ButtonWidget(
                  onPressed: () {
                    contactProviderNotListening.postData();
                    openDialog(
                        context: context,
                        title: 'Create Contact',
                        content: [
                          Consumer<ContactViewModel>(
                              builder: (context, value, child) =>
                                  value.statusCode == '201'
                                      ? const Text('Data created successfuly!')
                                      : const Text('Sending data...'))
                        ]);
                  },
                  label: 'POST Data'),

              ButtonWidget(
                  onPressed: () {
                    contactProviderNotListening.getData();
                    openDialog(
                        context: context,
                        title: 'Get Contact',
                        content: [
                          Consumer<ContactViewModel>(
                            builder: (context, value, child) => value
                                        .contact2.id ==
                                    0
                                ? const Text('Fetching data...')
                                : Column(
                                    children: [
                                      Text('ID: ${value.contact2.id}'),
                                      Text('Name: ${value.contact2.name}'),
                                      Text('Phone: ${value.contact2.phone}'),
                                    ],
                                  ),
                          )
                        ]);
                  },
                  label: 'GET Data Contact 2'),
            ],
          ),
        ));
  }
}
```

3. ViewModel merupakan class yang akan menangani logic dari aplikasi kita dan menjembatani antara View dan Model. Kita dapat memanggil property ataupun method class ViewModel dari class View(UI) yang akan menjalankan perintah untuk mengolah data dari Model lalu ditampilkan ke dalam UI.

- Contoh class ViewModel untuk mengirim dan mendapatkan data contact dari API

```dart
class ContactViewModel extends ChangeNotifier {
  String _statusCode = '';
  String get statusCode => _statusCode;

  ContactModel _contact2 = ContactModel(id: 0, name: '', phone: '');
  ContactModel get contact2 => _contact2;

  final TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;

  final TextEditingController _phoneController = TextEditingController();
  TextEditingController get phoneController => _phoneController;

  void postData() async {
    final postResponse = await ContactApi().postContact(
        dataContact:
            ContactModel(name: nameController.text, phone: phoneController.text)
                .toJson());

    _statusCode = postResponse;
    notifyListeners();
  }

  void getData() async {
    final getResponse = await ContactApi().getContact();

    _contact2 = ContactModel.fromJson(getResponse);
    notifyListeners();
  }
}
```