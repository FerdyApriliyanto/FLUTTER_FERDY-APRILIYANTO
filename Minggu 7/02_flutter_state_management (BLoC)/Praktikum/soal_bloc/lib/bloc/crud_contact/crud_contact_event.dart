part of 'crud_contact_bloc.dart';

sealed class CrudContactEvent extends Equatable {
  const CrudContactEvent();
}

class CreateContact extends CrudContactEvent {
  final String name;
  final String phone;
  final DateTime dateTime;
  final Color color;
  final String fileName;

  const CreateContact(
      {required this.name,
      required this.phone,
      required this.dateTime,
      required this.color,
      required this.fileName});

  @override
  List<Object> get props => [name, phone, dateTime, color, fileName];
}

class UpdateContact extends CrudContactEvent {
  final String name;
  final String phone;
  final DateTime dateTime;
  final Color color;
  final String fileName;
  final int index;

  const UpdateContact({
    required this.name,
    required this.phone,
    required this.dateTime,
    required this.color,
    required this.fileName,
    required this.index,
  });

  @override
  List<Object> get props => [name, phone, dateTime, color, fileName, index];
}

class DeleteContact extends CrudContactEvent {
  final int id;

  const DeleteContact({required this.id});

  @override
  List<Object> get props => [id];
}
