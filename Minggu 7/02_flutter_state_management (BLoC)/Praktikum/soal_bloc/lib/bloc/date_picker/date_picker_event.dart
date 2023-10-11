part of 'date_picker_bloc.dart';

sealed class DatePickerEvent extends Equatable {
  const DatePickerEvent();
}

class OpenDatePicker extends DatePickerEvent {
  final BuildContext context;

  const OpenDatePicker({required this.context});

  @override
  List<Object> get props => [context];
}

class SetDatePicked extends DatePickerEvent {
  final DateTime selectedDateTime;

  const SetDatePicked({required this.selectedDateTime});

  @override
  List<Object> get props => [selectedDateTime];
}
