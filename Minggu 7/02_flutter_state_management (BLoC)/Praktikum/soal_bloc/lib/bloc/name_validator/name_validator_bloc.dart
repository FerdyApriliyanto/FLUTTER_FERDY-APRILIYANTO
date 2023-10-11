import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'name_validator_event.dart';
part 'name_validator_state.dart';

class NameValidatorBloc extends Bloc<NameValidatorEvent, NameValidatorState> {
  NameValidatorBloc() : super(const NameValidatorInitial(nameValue: '')) {
    on<NameFieldChanged>((event, emit) {
      final isContainNumber = RegExp(r'[0-9]').hasMatch(event.nameValue);
      final isContainSpecialChar =
          RegExp(r'[!@#$%^&*(),.?+=":{}|<>]').hasMatch(event.nameValue);
      String nameErrorMsg = '';

      if (event.nameValue.isEmpty) {
        nameErrorMsg = 'Nama harus diisi';
      } else if (event.nameValue.length < 2) {
        nameErrorMsg = 'Nama minimal 2 karakter';
      } else if (event.nameValue[0].toUpperCase() != event.nameValue[0]) {
        nameErrorMsg = 'Huruf pertama harus uppercase';
      } else if (isContainNumber) {
        nameErrorMsg = 'Nama tidak boleh mengandung angka';
      } else if (isContainSpecialChar) {
        nameErrorMsg = 'Nama tidak boleh mengandung karakter khusus';
      } else {
        nameErrorMsg = '';
      }

      if (nameErrorMsg.isEmpty) {
        emit(NameValidatorSuccess(nameValue: event.nameValue));
      } else {
        emit(NameValidatorFailed(errorMsg: nameErrorMsg, nameValue: ''));
      }
    });

    on<ResetNameValue>((event, emit) {
      emit(const NameValidatorFailed(
          nameValue: '', errorMsg: 'Nama harus diisi'));
    });

    on<UpdateNameValue>((event, emit) {
      emit(NameValidatorSuccess(nameValue: event.selectedName));
    });
  }
}
