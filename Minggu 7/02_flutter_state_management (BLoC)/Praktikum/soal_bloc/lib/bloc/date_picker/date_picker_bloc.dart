import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'date_picker_event.dart';
part 'date_picker_state.dart';

class DatePickerBloc extends Bloc<DatePickerEvent, DatePickerState> {
  DatePickerBloc() : super(DatePickerInitial()) {
    on<OpenDatePicker>((event, emit) async {
      final getDatePicker = await showDatePicker(
          context: event.context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1970),
          lastDate: DateTime(DateTime.now().year + 10));

      getDatePicker != null
          ? emit(DatePickerSelected(selectedDate: getDatePicker))
          : emit(DatePickerNotSelected());
    });

    on<SetDatePicked>((event, emit) {
      emit(DatePickerSelected(selectedDate: event.selectedDateTime));
    });
  }
}
