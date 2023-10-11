part of 'date_picker_bloc.dart';

sealed class DatePickerState extends Equatable {
  const DatePickerState();
}

final class DatePickerInitial extends DatePickerState {
  @override
  List<Object> get props => [];
}

final class DatePickerSelected extends DatePickerState {
  final DateTime selectedDate;

  const DatePickerSelected({required this.selectedDate});

  @override
  List<Object> get props => [selectedDate];
}

final class DatePickerNotSelected extends DatePickerState {
  @override
  List<Object> get props => [];
}
