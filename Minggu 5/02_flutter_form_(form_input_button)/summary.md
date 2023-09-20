# summary

1. Form merupakan widget untuk menampung data inputtan user dan dapat memuat beberapa komponen lain seperti TextFormField/TextField dan juga ElevatedButton untuk megolah data inputannya. Form digunakan melalui stateful widget dan state/keadaan form disimpan melalui ```GlobalKey<FormState>```.

- Contoh penggunaan Form dalam stateful widget

```dart
class MyFormWidget extends StatefulWidget {
  @override
  _MyFormWidgetState createState() => _MyFormWidgetState();
}

class _MyFormWidgetState extends State<MyFormWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            //
          ),
          TextFormField(
            //
          ),
          ElevatedButton(
            onPressed: () {
              //
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
```

2. Ada beberapa cara untuk menerima nilai inputtan dari user, kita dapat menggunakan widget seperti TextField untuk menerima data ketikkan dari user, Radio untuk memberikan user opsi memilih yang hanya dapat dipilih satu, Checkbox untuk memberikan user opsi yang dapat dipilih lebih dari satu, dan masih banyak lagi seperti Toggle, DropdownButton maupun Switch. Penggunaan masing-masing widget ditentukan dari studi kasus dan jenis data apa yang ingin diambil serta metodenya.

- Contoh penggunaan TextField dengan menggunakan controller untuk menerima datanya

```dart
class MyTextField extends StatefulWidget {
  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: _controller,
        decoration: InputDecoration(
          labelText: 'Name',
          hintText: 'Type your name here ....',
        ),
        onChanged: (text) {
          //
        },
      ),
  }
}
```

3. Untuk mengolah data yang sudah diambil dari widget penerima inputtan, kita dapat menggunakan button seperti ElevatedButton ataupun IconButton yang berbentuk seperti icon namun bisa ditekan dan menjalankan perintah yang berada di fungsi callback onPressed.
   
- Contoh penggunaan ElevatedButton

```dart
class MyElevatedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print('Button pressed');
      },
      child: Text('Submit'),
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        onPrimary: Colors.white, 
        padding: EdgeInsets.all(14), 
      ),
    );
  }
}
```
   
