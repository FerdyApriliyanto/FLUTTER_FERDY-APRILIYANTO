# summary

1. BLoC merupakan state management dalam flutter yang memisahkan business logic dan komponen UI dan membaginya menjadi 3 komponen utama yaitu state, event dan juga BLoC itu sendiri. Untuk mengunakan bloc kita memerlukan 2 package, yaitu flutter_bloc jan juga equatable dan mendaftarkannya di main menggunakan BlocProvider atau MultiBlocProvider jika menggunakan beberapa BLoC yang berbeda. State merupakan kelas yang menampung kondisi BLoC itu sendiri dan dilambangkan menggunakan class.

- Berikut merupakan contoh kelas state dari BLoC yang bertugas memvalidasi inputtan TextField nama.

```dart
part of 'name_validator_bloc.dart';

sealed class NameValidatorState extends Equatable {
  final String nameValue;

  const NameValidatorState({required this.nameValue});

  @override
  List<Object> get props => [nameValue];
}

final class NameValidatorInitial extends NameValidatorState {
  const NameValidatorInitial({required super.nameValue});
}

final class NameValidatorSuccess extends NameValidatorState {
  const NameValidatorSuccess({required super.nameValue});
}

final class NameValidatorFailed extends NameValidatorState {
  final String errorMsg;

  const NameValidatorFailed({required this.errorMsg, required super.nameValue});

  @override
  List<Object> get props => [errorMsg];
}
```

2. Event dalam BLoC dilambangkan menggunakan class dan akan menampung data inputtan dari UI melalui constructor. Ketika kelas event ini dipanggil di UI, maka BLoC akan menjalankan fungsi berdasarkan event yang dipanggil dan kita dapat menggunakan value dari constructor event yang dipanggil menggunakan event.namaProperty.

- Berikut contoh class event dari BLoC yang bertugas memvalidasi inputtan TextField nama

```dart
part of 'name_validator_bloc.dart';

sealed class NameValidatorEvent extends Equatable {
  const NameValidatorEvent();
}

class NameFieldChanged extends NameValidatorEvent {
  final String nameValue;

  const NameFieldChanged({required this.nameValue});

  @override
  List<Object> get props => [nameValue];
}

class ResetNameValue extends NameValidatorEvent {
  @override
  List<Object> get props => [];
}

class UpdateNameValue extends NameValidatorEvent {
  final String selectedName;

  const UpdateNameValue({required this.selectedName});

  @override
  List<Object> get props => [selectedName];
}

```

3. Class BLoC dalam flutter bloc merupakan tempat kita melakukan business logicnya ketika event tertentu dipanggil melalui UI dan akan menghasilkan sebuah state baru dari prosesnya yang ditulis menggunakan emit. Ketika state dari BLoC ini berubah, maka seluruh komponen yang menggunakan BlocBuilder akan merender ulang komponen UI yang menggunakan statenya.

- Berikut contoh class BLoC dari BLoC yang bertugas memvalidasi inputtan TextField nama

```dart
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
```