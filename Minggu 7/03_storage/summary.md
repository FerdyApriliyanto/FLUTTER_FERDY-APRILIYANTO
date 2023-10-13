# summary

1. Dalam flutter, kita dapat menggunakan local storage melalui dua cara, pertama dengan package SharedPrefences untuk menyimpan data sederhana seperti data string atau integer dan biasa digunakan untuk menyimpan username maupun token saat user melakukan login. Data dalam SharedPreferences disimpan dan diakses melalui sebuah key. SharedPreferences juga dapat digunakan untuk memeriksa apakah user sudah login atau belum dan dapat mengarahkan user ke halaman yang tepat.

- Contoh penggunaan SharedPreferences untuk menentukan halaman pertama saat user membuka aplikasi berdasarkan kondisi sudah login atau belum yang diletakkan pada initState() login screen

```dart
late SharedPreferences loginData;
  late bool isUserLoggedIn;

  void isLoggedIn() async {
    loginData = await SharedPreferences.getInstance();
    isUserLoggedIn = loginData.getBool('isLoggedIn') ?? false;

    if (mounted) {
      if (isUserLoggedIn == true) {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      }
    }
  }

  @override
  void initState() {
    isLoggedIn();
    super.initState();
  }
```

2. Kedua, kita dapat menggunakan database SQLite local melalui package sqflite. Penggunaan database local ini berfungsi untuk meyimpan dan mengolah data yang lebih kompleks. Dengan menggunakan sqflite, kita dapat melakukan transaksi SQL seperti insert, select, delete dan juga update secara local. Untuk menggunakan sqflite kita perlu membuat helper untuk membuat dan melakukan transaksi langsung ke database local

- Contoh class helper database local
  
 ```dart
class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static late Database _database;

  final String _tableName = 'contacts';

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  Future<Database> _initializeDb() async {
    var db = openDatabase(
      join(await getDatabasesPath(), 'contact_db.db'),
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $_tableName(
        id INTEGER PRIMARY KEY,
        name TEXT,
        phone TEXT
      )''');
      },
      version: 1,
    );

    return db;
  }

  Future<void> insertContact(ContactModel contactModel) async {
    final Database db = await database;
    await db.insert(_tableName, contactModel.toMap());
  }

  Future<List<ContactModel>> getContacts() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableName);

    return results.map((e) => ContactModel.fromMap(e)).toList();
  }

  Future<ContactModel> getContactById(int id) async {
    final Database db = await database;
    List<Map<String, dynamic>> results =
        await db.query(_tableName, where: 'id = ?', whereArgs: [id]);

    return results.map((e) => ContactModel.fromMap(e)).first;
  }

  Future<void> updateContact(ContactModel contactModel, int id) async {
    final db = await database;
    await db.update(_tableName, contactModel.toMap(),
        where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteContact(int id) async {
    final db = await database;
    await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteAllContact() async {
    final db = await database;
    await db.delete(_tableName);
  }
}
```

- Contoh penggunaan database local SQLite menggunakan package sqflite untuk transaksi CRUD data contact melalui ViewModel provider

```dart
class DbManager extends ChangeNotifier {
  List<ContactModel> _contactModels = [];
  late DatabaseHelper _dbHelper;

  List<ContactModel> get contactModels => _contactModels;

  DbManager() {
    _dbHelper = DatabaseHelper();
    _getAllContacts();
  }

  void _getAllContacts() async {
    _contactModels = await _dbHelper.getContacts();
    notifyListeners();
  }

  Future<void> addContact(ContactModel contactModel) async {
    await _dbHelper.insertContact(contactModel);
    _getAllContacts();
  }

  Future<ContactModel> getContactById(int id) async {
    return await _dbHelper.getContactById(id);
  }

  Future<List<ContactModel>> getContacts() async {
    return await _dbHelper.getContacts();
  }

  void updateContact(ContactModel contactModel, int id) async {
    await _dbHelper.updateContact(contactModel, id);
    _getAllContacts();
  }

  void deleteContact(int id) async {
    await _dbHelper.deleteContact(id);
    _getAllContacts();
  }

  void deleteAllContact() async {
    await _dbHelper.deleteAllContact();
    _getAllContacts();
  }
}
```

3. Untuk menggunakan method dari ViewModel yang sudah kita buat, kita hanya perlu memanggil method ViewModelnya melalui provider dan memberikan data parameternya yang sesuai.

- Contoh pemanggilan di UI

```dart
final dbManagerProvider = Provider.of<DbManager>(context, listen: false);

dbManagerProvider.deleteAllContact();

dbManagerProvider.addContact(ContactModel(
        id: currentContactLength,
        name: nameController.text,
        phone: phoneController.text));
```
   
