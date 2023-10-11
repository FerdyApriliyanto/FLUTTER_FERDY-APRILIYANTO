import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:soal_bloc/models/contact_model.dart';

part 'crud_contact_event.dart';
part 'crud_contact_state.dart';

class CrudContactBloc extends Bloc<CrudContactEvent, CrudContactState> {
  CrudContactBloc() : super(const CrudContactInitial(contactList: [])) {
    on<CreateContact>((event, emit) {
      List<ContactModel> contactList = List.from(state.contactList);

      contactList.add(ContactModel(
          name: event.name,
          phone: event.phone,
          dateTime: event.dateTime,
          color: event.color,
          fileName: event.fileName));

      emit(CreateContactSuccess(contactList: contactList));
    });

    on<DeleteContact>((event, emit) {
      List<ContactModel> contactListAfterDelete = List.from(state.contactList);

      contactListAfterDelete.removeAt(event.id);

      emit(DeleteContactSuccess(contactList: contactListAfterDelete));
    });

    on<UpdateContact>((event, emit) {
      List<ContactModel> contactListAfterUpdate = List.from(state.contactList);

      contactListAfterUpdate[event.index] = ContactModel(
          name: event.name,
          phone: event.phone,
          dateTime: event.dateTime,
          color: event.color,
          fileName: event.fileName);

      emit(UpdateContactSuccess(contactList: contactListAfterUpdate));
    });
  }
}
