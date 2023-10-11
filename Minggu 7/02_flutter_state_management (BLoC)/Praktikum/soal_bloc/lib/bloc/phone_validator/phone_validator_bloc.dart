import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'phone_validator_event.dart';
part 'phone_validator_state.dart';

class PhoneValidatorBloc
    extends Bloc<PhoneValidatorEvent, PhoneValidatorState> {
  PhoneValidatorBloc() : super(const PhoneValidatorInitial(phoneValue: '')) {
    on<PhoneFieldChanged>((event, emit) {
      String phoneErrorMsg = '';
      if (event.phoneValue.isEmpty) {
        phoneErrorMsg = 'No Telp harus diisi';
      } else if (event.phoneValue[0] != '0') {
        phoneErrorMsg = 'No Telp harus dimulai dari angka 0';
      } else if (event.phoneValue.length < 8 || event.phoneValue.length > 15) {
        phoneErrorMsg = 'No Telp minimal 8 digit dan maksimal 15 digit';
      } else {
        phoneErrorMsg = '';
      }

      if (phoneErrorMsg.isEmpty) {
        emit(PhoneValidatorSuccess(phoneValue: event.phoneValue));
      } else {
        emit(PhoneValidatorFailed(errorMsg: phoneErrorMsg, phoneValue: ''));
      }
    });

    on<ResetPhoneValue>((event, emit) {
      emit(const PhoneValidatorFailed(
          phoneValue: '', errorMsg: 'No Telp harus diisi'));
    });

    on<UpdatePhoneValue>((event, emit) {
      emit(PhoneValidatorSuccess(phoneValue: event.selectedPhone));
    });
  }
}
