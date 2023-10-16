import 'package:flutter/material.dart';
import 'package:praktikum/models/api/put_request_api.dart';
import 'package:praktikum/models/put_request_model.dart';

class PutRequestViewmodel extends ChangeNotifier {
  String _status = '';
  String get status => _status;

  final TextEditingController _idController = TextEditingController();
  TextEditingController get idController => _idController;

  final TextEditingController _titleController = TextEditingController();
  TextEditingController get titleController => _titleController;

  final TextEditingController _bodyController = TextEditingController();
  TextEditingController get bodyController => _bodyController;

  final TextEditingController _userIdController = TextEditingController();
  TextEditingController get userIdController => _userIdController;

  Future<void> updateData() async {
    _status = await PutRequestApi().putData(
        dataPut: PutRequestModel(
                userId: int.tryParse(_idController.text) ?? 0,
                id: int.tryParse(_titleController.text) ?? 0,
                title: _titleController.text,
                body: _bodyController.text)
            .toJson());

    notifyListeners();
  }
}
